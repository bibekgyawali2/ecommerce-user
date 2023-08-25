// ignore_for_file: non_constant_identifier_names

class AddressModal {
  String? user_id;
  String? phone;
  String? otherDescription;
  String? Street;
  String? Province;
  String? PostalCode;
  String? Country;
  String? City;

  AddressModal({
    this.City,
    this.Country,
    this.PostalCode,
    this.Province,
    this.Street,
    this.otherDescription,
    this.phone,
    this.user_id,
  });

  AddressModal.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["City"] = City;
    data["Country"] = Country;
    data["PostalCode"] = PostalCode;
    data["Province"] = Province;
    data["Street"] = Street;
    data["otherDescription"] = otherDescription;
    data['phone'] = phone;
    data['user_id'] = user_id;
    return data;
  }
}
