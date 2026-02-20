// Cart utility for managing shopping cart state
// Uses localStorage for persistence across sessions

export interface CartItem {
  id: number;
  name: string;
  price: number;
  image: string;
  quantity: number;
  description?: string;
}

export interface Cart {
  items: CartItem[];
  total: number;
  itemCount: number;
}

const CART_STORAGE_KEY = 'k2spiceshop_cart';

// Get cart from localStorage
export function getCart(): Cart {
  if (typeof window === 'undefined') {
    return { items: [], total: 0, itemCount: 0 };
  }

  const cartData = localStorage.getItem(CART_STORAGE_KEY);
  if (!cartData) {
    return { items: [], total: 0, itemCount: 0 };
  }

  try {
    const items = JSON.parse(cartData) as CartItem[];
    return calculateCart(items);
  } catch {
    return { items: [], total: 0, itemCount: 0 };
  }
}

// Save cart to localStorage
export function saveCart(items: CartItem[]): void {
  if (typeof window === 'undefined') return;
  localStorage.setItem(CART_STORAGE_KEY, JSON.stringify(items));
}

// Calculate totals
export function calculateCart(items: CartItem[]): Cart {
  const itemCount = items.reduce((sum, item) => sum + item.quantity, 0);
  const total = items.reduce((sum, item) => sum + item.price * item.quantity, 0);
  
  return {
    items,
    total: Math.round(total * 100) / 100,
    itemCount,
  };
}

// Add item to cart
export function addToCart(product: Omit<CartItem, 'quantity'>, quantity: number = 1): Cart {
  const cart = getCart();
  const existingItem = cart.items.find(item => item.id === product.id);

  if (existingItem) {
    existingItem.quantity += quantity;
  } else {
    cart.items.push({ ...product, quantity });
  }

  saveCart(cart.items);
  return calculateCart(cart.items);
}

// Remove item from cart
export function removeFromCart(productId: number): Cart {
  const cart = getCart();
  cart.items = cart.items.filter(item => item.id !== productId);
  saveCart(cart.items);
  return calculateCart(cart.items);
}

// Update item quantity
export function updateQuantity(productId: number, quantity: number): Cart {
  const cart = getCart();
  const item = cart.items.find(item => item.id === productId);

  if (item) {
    if (quantity <= 0) {
      cart.items = cart.items.filter(item => item.id !== productId);
    } else {
      item.quantity = quantity;
    }
  }

  saveCart(cart.items);
  return calculateCart(cart.items);
}

// Clear entire cart
export function clearCart(): Cart {
  if (typeof window !== 'undefined') {
    localStorage.removeItem(CART_STORAGE_KEY);
  }
  return { items: [], total: 0, itemCount: 0 };
}