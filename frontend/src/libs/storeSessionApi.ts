import { StandardApiResponseProps } from "../types/StandardApiResponseProps";
import { StoreLoginProps } from "../types/StoreLoginProps";
import { ApiClient } from "./ApiClient";

export const storeSessionCreateApi = async (
  data: StoreLoginProps
): Promise<StandardApiResponseProps> => {
  const response = (await ApiClient.post(
    "/api/convenience_store/session",
    data
  )) as StandardApiResponseProps;
  return response;
};

type ResponseProps = Readonly<{
  data: { name: string };
}>;

export const storeSessionFetchApi = async (): Promise<ResponseProps> => {
  const response = (await ApiClient.get(
    "/api/convenience_store/session"
  )) as ResponseProps;
  return response;
};

export const storeSessionDeleteApi = async (): Promise<ResponseProps> => {
  const response = (await ApiClient.delete(
    "/api/convenience_store/session"
  )) as ResponseProps;
  return response;
};
