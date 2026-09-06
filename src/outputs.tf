output "all_vms" {
  value = concat(
    [for i in yandex_compute_instance.web : {
      name = i.name
      id   = i.id
      fqdn = i.fqdn
    }],
    [for k, v in yandex_compute_instance.db : {
      name = v.name
      id   = v.id
      fqdn = v.fqdn
    }],
    [{
      name = yandex_compute_instance.storage.name
      id   = yandex_compute_instance.storage.id
      fqdn = yandex_compute_instance.storage.fqdn
    }]
  )
  description = "Список всех ВМ (web, db, storage) с name, id, fqdn"
}