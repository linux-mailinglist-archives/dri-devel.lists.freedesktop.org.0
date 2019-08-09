Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EBE87977
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 14:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB5C6EDEF;
	Fri,  9 Aug 2019 12:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947256EDED
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 12:11:25 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hw3jw-0006VL-5P; Fri, 09 Aug 2019 14:11:24 +0200
Message-ID: <1565352684.2323.62.camel@pengutronix.de>
Subject: Re: [PATCH v2] etnaviv: fix whitespace errors
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, 
 dri-devel@lists.freedesktop.org
Date: Fri, 09 Aug 2019 14:11:24 +0200
In-Reply-To: <20190802112656.15280-1-christian.gmeiner@gmail.com>
References: <20190802112656.15280-1-christian.gmeiner@gmail.com>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRnJlaXRhZywgZGVuIDAyLjA4LjIwMTksIDEzOjI2ICswMjAwIHNjaHJpZWIgQ2hyaXN0aWFu
IEdtZWluZXI6Cj4gQ2hhbmdlcyBpbiBWMjoKPiDCoC0gdXNlIGluZGVudGF0aW9uIGFzIHN1Z2dl
c3RlZCBieSBQaGlsaXBwIFphYmVsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBHbWVp
bmVyIDxjaHJpc3RpYW4uZ21laW5lckBnbWFpbC5jb20+CgpUaGFua3MsIGFwcGxpZWQuCgpSZWdh
cmRzLApMdWNhcwoKPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfcGVy
Zm1vbi5jIHwgNCArKy0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5h
dml2X3BlcmZtb24uYwo+IGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9wZXJmbW9u
LmMKPiBpbmRleCA0MjI3YTQwMDZjMzQuLmVmMjRhMDhhNThiMCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X3BlcmZtb24uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9ldG5hdml2L2V0bmF2aXZfcGVyZm1vbi5jCj4gQEAgLTE1LDggKzE1LDggQEAgc3RydWN0
IGV0bmF2aXZfcG1fc2lnbmFsIHsKPiDCoAl1MzIgZGF0YTsKPiDCoAo+IMKgCXUzMiAoKnNhbXBs
ZSkoc3RydWN0IGV0bmF2aXZfZ3B1ICpncHUsCj4gLQnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgY29uc3Qgc3RydWN0IGV0bmF2aXZfcG1fZG9tYWluICpkb21haW4sCj4gLQnCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgY29uc3Qgc3RydWN0IGV0bmF2aXZfcG1fc2lnbmFsICpzaWduYWwp
Owo+ICsJCcKgwqDCoMKgwqDCoGNvbnN0IHN0cnVjdCBldG5hdml2X3BtX2RvbWFpbiAqZG9tYWlu
LAo+ICsJCcKgwqDCoMKgwqDCoGNvbnN0IHN0cnVjdCBldG5hdml2X3BtX3NpZ25hbCAqc2lnbmFs
KTsKPiDCoH07Cj4gwqAKPiDCoHN0cnVjdCBldG5hdml2X3BtX2RvbWFpbiB7Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
