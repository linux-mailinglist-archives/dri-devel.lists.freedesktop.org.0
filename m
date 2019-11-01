Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A61FEC86C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 19:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1608B6F534;
	Fri,  1 Nov 2019 18:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7636F534
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 18:24:34 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Nov 2019 11:24:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,256,1569308400"; d="scan'208";a="203931779"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com) ([10.54.75.49])
 by orsmga003.jf.intel.com with ESMTP; 01 Nov 2019 11:24:33 -0700
Date: Fri, 1 Nov 2019 11:27:10 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Subject: Re: [PATCH] drm/vkms: Fix typo in function documentation
Message-ID: <20191101182709.GA32264@intel.com>
References: <20191101182102.30358-1-gabrielabittencourt00@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191101182102.30358-1-gabrielabittencourt00@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: hamohammed.sa@gmail.com, trivial@kernel.org, rodrigosiqueiramelo@gmail.com,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, outreachy-kernel@googlegroups.com,
 lkcamp@lists.libreplanetbr.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMDEsIDIwMTkgYXQgMDM6MjE6MDJQTSAtMDMwMCwgR2FicmllbGEgQml0dGVu
Y291cnQgd3JvdGU6Cj4gRml4IHR5cG8gaW4gd29yZCAnYmxlbmQnIGluIGZ1bmN0aW9uICdjb21w
dXRlX2NyYycgZG9jdW1lbnRhdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHYWJyaWVsYSBCaXR0
ZW5jb3VydCA8Z2FicmllbGFiaXR0ZW5jb3VydDAwQGdtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBN
YW5hc2kgTmF2YXJlIDxtYW5hc2kuZC5uYXZhcmVAaW50ZWwuY29tPgoKTWFuYXNpCgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NvbXBvc2VyLmMgfCAyICstCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NvbXBvc2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmtt
cy92a21zX2NvbXBvc2VyLmMKPiBpbmRleCBkNTU4NTY5NWM2NGQuLjE1ZWZjY2RjY2UxYiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NvbXBvc2VyLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NvbXBvc2VyLmMKPiBAQCAtNDMsNyArNDMsNyBAQCBz
dGF0aWMgdWludDMyX3QgY29tcHV0ZV9jcmModm9pZCAqdmFkZHJfb3V0LCBzdHJ1Y3Qgdmttc19j
b21wb3NlciAqY29tcG9zZXIpCj4gIH0KPiAgCj4gIC8qKgo+IC0gKiBibGVuZCAtIGJlbG5kIHZh
bHVlIGF0IHZhZGRyX3NyYyB3aXRoIHZhbHVlIGF0IHZhZGRyX2RzdAo+ICsgKiBibGVuZCAtIGJs
ZW5kIHZhbHVlIGF0IHZhZGRyX3NyYyB3aXRoIHZhbHVlIGF0IHZhZGRyX2RzdAo+ICAgKiBAdmFk
ZHJfZHN0OiBkZXN0aW5hdGlvbiBhZGRyZXNzCj4gICAqIEB2YWRkcl9zcmM6IHNvdXJjZSBhZGRy
ZXNzCj4gICAqIEBkZXN0X2NvbXBvc2VyOiBkZXN0aW5hdGlvbiBmcmFtZWJ1ZmZlcidzIG1ldGFk
YXRhCj4gLS0gCj4gMi4yMC4xCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
