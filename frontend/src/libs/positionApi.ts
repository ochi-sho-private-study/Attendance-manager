import { ApiClient } from "./ApiClient";

type ResponseProps = Readonly<{
  positions: [];
}>;

export const positionsfetchApi = async (): Promise<ResponseProps> => {
  const response = (await ApiClient.get(
    "/api/convenience_store/positions"
  )) as ResponseProps;
  return response;
};
