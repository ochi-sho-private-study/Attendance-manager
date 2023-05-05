import { ApiClient } from "./ApiClient";

type PositionsResponseProps = Readonly<{
  data: { positions: [] };
}>;

export const positionsfetchApi = async (): Promise<PositionsResponseProps> => {
  const response = (await ApiClient.get(
    "/api/convenience_store/positions"
  )) as PositionsResponseProps;
  return response;
};

type PositionResponseProps = Readonly<{
  data: {
    position: {
      id: number;
      name: string;
    };
  };
}>;

export const positionUpdateApi = async (
  id: number,
  name: string
): Promise<PositionResponseProps> => {
  const response = (await ApiClient.put(
    `/api/convenience_store/positions/${id}`,
    { position: { name: name } }
  )) as PositionResponseProps;
  return response;
};
