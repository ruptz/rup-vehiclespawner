export interface Vehicle {
  /** Spawn name */
  model: string
  /** Vehicles Display Name **/
  label: string
}

export type VehicleModels = Record<string, Vehicle[]>

/** RGB num options */
export interface RGB {
  r: number
  g: number
  b: number
}

/** Spawn options in bottom left of the UI */
export interface SpawnOptions {
  applyColor: boolean
  primary: RGB
  secondary: RGB
  maxTuned: boolean
}
