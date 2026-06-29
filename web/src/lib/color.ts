import type { RGB } from '../types'

export function hexToRgb(hex: string): RGB {
  const v = hex.replace('#', '')
  return {
    r: parseInt(v.slice(0, 2), 16),
    g: parseInt(v.slice(2, 4), 16),
    b: parseInt(v.slice(4, 6), 16),
  }
}

export function rgbToHex({ r, g, b }: RGB): string {
  const c = (n: number) => n.toString(16).padStart(2, '0')
  return `#${c(r)}${c(g)}${c(b)}`
}
