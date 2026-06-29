import { useEffect, useRef } from 'react'

type Handler<T> = (data: T) => void

export function useNuiEvent<T = unknown>(name: string, handler: Handler<T>): void {
  const saved = useRef<Handler<T>>(handler)
  saved.current = handler

  useEffect(() => {
    const listener = (event: MessageEvent) => {
      const data = event.data ?? {}
      if (data.type === name || data.action === name) {
        saved.current(data as T)
      }
    }
    window.addEventListener('message', listener)
    return () => window.removeEventListener('message', listener)
  }, [name])
}
