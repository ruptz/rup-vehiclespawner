declare function GetParentResourceName(): string

export const isEnvBrowser = (): boolean =>
  typeof (window as unknown as { invokeNative?: unknown }).invokeNative === 'undefined'

export function resourceName(): string {
  try {
    return GetParentResourceName()
  } catch {
    return 'rup-vehiclespawner'
  }
}

export async function fetchNui<T = unknown>(event: string, data: unknown = {}): Promise<T | null> {
  if (isEnvBrowser()) return null

  const resp = await fetch(`https://${resourceName()}/${event}`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json; charset=UTF-8' },
    body: JSON.stringify(data),
  })

  try {
    return (await resp.json()) as T
  } catch {
    return null
  }
}
