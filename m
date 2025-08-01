Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3102BB184BD
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 17:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DCC10E8A3;
	Fri,  1 Aug 2025 15:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB12D10E049;
 Fri,  1 Aug 2025 15:13:48 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:9e5c:8eff:fec0:ee40] (unknown
 [IPv6:2400:2410:b120:f200:9e5c:8eff:fec0:ee40])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 241D03F116;
 Fri,  1 Aug 2025 17:13:45 +0200 (CEST)
Message-ID: <8f8ad642-bc62-4210-be11-6a5bd64411c5@hogyros.de>
Date: Sat, 2 Aug 2025 00:13:42 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Mark xe driver as BROKEN if kernel page size is not 4kB
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <460b95285cdf23dc6723972ba69ee726b3b3cfba.camel@linux.intel.com>
 <20250801102130.2644-1-Simon.Richter@hogyros.de>
 <274fefe9b46bb856e5968431ed524ebe1b8e8cd4.camel@linux.intel.com>
 <37abb9a1a4fde174a54a9d7868d31b2615df0e47.camel@linux.intel.com>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <37abb9a1a4fde174a54a9d7868d31b2615df0e47.camel@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wNpcGvIeCpp5TfJ0uKxU5349"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wNpcGvIeCpp5TfJ0uKxU5349
Content-Type: multipart/mixed; boundary="------------CTEnt37qgnx0gBPXTd3N0LIT";
 protected-headers="v1"
From: Simon Richter <Simon.Richter@hogyros.de>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <8f8ad642-bc62-4210-be11-6a5bd64411c5@hogyros.de>
Subject: Re: [PATCH v3] Mark xe driver as BROKEN if kernel page size is not
 4kB
References: <460b95285cdf23dc6723972ba69ee726b3b3cfba.camel@linux.intel.com>
 <20250801102130.2644-1-Simon.Richter@hogyros.de>
 <274fefe9b46bb856e5968431ed524ebe1b8e8cd4.camel@linux.intel.com>
 <37abb9a1a4fde174a54a9d7868d31b2615df0e47.camel@linux.intel.com>
In-Reply-To: <37abb9a1a4fde174a54a9d7868d31b2615df0e47.camel@linux.intel.com>

--------------CTEnt37qgnx0gBPXTd3N0LIT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCk9uIDgvMS8yNSAyMzo1NiwgVGhvbWFzIEhlbGxzdHLDtm0gd3JvdGU6DQoNCj4g
V291bGQgeW91IG1pbmQgaWYgd2UgZGlkIHRoZSBmb2xsb3dpbmc6DQoNClsuLi5dDQoNCj4g
QW5kIGluc3RlYWQgaGVyZSBhZGQNCj4gCWRlcGVuZHMgb24gUEFHRV9TSVpFXzRLQiB8fCBD
T01QSUxFX1RFU1QgfHwgQlJPS0VODQoNClRoYXQgaXMgYSBsb3QgbmljZXIsIEkgbGlrZSBp
dC4NCg0KICAgIFNpbW9uDQo=

--------------CTEnt37qgnx0gBPXTd3N0LIT--

--------------wNpcGvIeCpp5TfJ0uKxU5349
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEtjuqOJSXmNjSiX3Tfr04e7CZCBEFAmiM2aYACgkQfr04e7CZ
CBELugf8DqUbmek/kQtrnhBllfJ7bBzpmAmD+F0ojUiPgJS9JT+rKEvRLJYaboyK
EbwvUNQkcks0/dWYLoo0+nSCeeabgxCmADS9qwE7Q/aS4y+m2CmgIeKqnnTsgVt9
ImIyfH+p5XJSFAAJ0VgaYN89z0mfCkmOfN6Y7ULBGamEEyu/21qXUS/6yP1xM4e9
1XlklQuIoekGfdpJzdrQ80zj69DU+iOvnoG0u00CsZDYBvhWZnPgMj3P6LW8E7Fu
N88a9Lbm09KvX7f1jv0V+Q0Ip5YoipkdrAflcIkr/aFn8bW2ECzcbyYojioZZqTF
iXNF1QKNvbPmK5Vk+phNqG1HSmmcKQ==
=Sg8e
-----END PGP SIGNATURE-----

--------------wNpcGvIeCpp5TfJ0uKxU5349--
