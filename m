Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 822E7D77BE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 15:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FAB06E804;
	Tue, 15 Oct 2019 13:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1166E808
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 13:53:20 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Oct 2019 06:53:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,300,1566889200"; d="scan'208";a="201761691"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 15 Oct 2019 06:53:15 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 15 Oct 2019 16:53:14 +0300
Date: Tue, 15 Oct 2019 16:53:14 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
Subject: Re: [PATCH] drm: Add LT-tunable PHY repeater mode operations
Message-ID: <20191015135314.GE1208@intel.com>
References: <20191015134010.26zwopwnrbsmz5az@outlook.office365.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191015134010.26zwopwnrbsmz5az@outlook.office365.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Berthe,
 Abdoulaye" <Abdoulaye.Berthe@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Manasi Navare <manasi.d.navare@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMDE6NDA6MTJQTSArMDAwMCwgU2lxdWVpcmEsIFJvZHJp
Z28gd3JvdGU6Cj4gTFQtdHVuYWJsZSBQSFkgUmVwZWF0ZXJzIGNhbiBvcGVyYXRlIGluIHR3byBk
aWZmZXJlbnQgbW9kZXM6IHRyYW5zcGFyZW50Cj4gKGRlZmF1bHQpIGFuZCBub24tdHJhbnNwYXJl
bnQuIFRoZSB2YWx1ZSAweDU1IHNwZWNpZmllcyB0aGUgdHJhbnNwYXJlbnQKPiBtb2RlLCBhbmQg
MHhhYSByZXByZXNlbnRzIHRoZSBub24tdHJhbnNwYXJlbnQ7IHRoaXMgY29tbWl0IGFkZHMgdGhl
c2UKPiB0d28gdmFsdWVzIGFzIGRlZmluaXRpb25zLgo+IAo+IENjOiBBYmRvdWxheWUgQmVydGhl
IDxBYmRvdWxheWUuQmVydGhlQGFtZC5jb20+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53
ZW50bGFuZEBhbWQuY29tPgo+IENjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiBDYzog
SmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzogTWFuYXNpIE5h
dmFyZSA8bWFuYXNpLmQubmF2YXJlQGludGVsLmNvbT4KPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBYmRvdWxheWUg
QmVydGhlIDxBYmRvdWxheWUuQmVydGhlQGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUm9kcmln
byBTaXF1ZWlyYSA8Um9kcmlnby5TaXF1ZWlyYUBhbWQuY29tPgoKUmV2aWV3ZWQtYnk6IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cgo+IC0tLQo+ICBpbmNs
dWRlL2RybS9kcm1fZHBfaGVscGVyLmggfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgg
Yi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKPiBpbmRleCBiZjYyYjQzYWFmMmIuLmNmYWRl
ZWVmODQ5MiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKPiArKysg
Yi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKPiBAQCAtMTAzNCw2ICsxMDM0LDEwIEBACj4g
ICNkZWZpbmUgRFBfU1lNQk9MX0VSUk9SX0NPVU5UX0xBTkUzX1BIWV9SRVBFQVRFUjEJICAgIDB4
ZjAwM2IgLyogMS4zICovCj4gICNkZWZpbmUgRFBfRkVDX1NUQVRVU19QSFlfUkVQRUFURVIxCQkJ
ICAgIDB4ZjAyOTAgLyogMS40ICovCj4gIAo+ICsvKiBSZXBlYXRlciBtb2RlcyAqLwo+ICsjZGVm
aW5lIERQX1BIWV9SRVBFQVRFUl9NT0RFX1RSQU5TUEFSRU5UCQkgICAgMHg1NSAgICAvKiAxLjMg
Ki8KPiArI2RlZmluZSBEUF9QSFlfUkVQRUFURVJfTU9ERV9OT05fVFJBTlNQQVJFTlQJCSAgICAw
eGFhICAgIC8qIDEuMyAqLwo+ICsKPiAgLyogRFAgSERDUCBtZXNzYWdlIHN0YXJ0IG9mZnNldHMg
aW4gRFBDRCBhZGRyZXNzIHNwYWNlICovCj4gICNkZWZpbmUgRFBfSERDUF8yXzJfQUtFX0lOSVRf
T0ZGU0VUCQlEUF9IRENQXzJfMl9SRUdfUlRYX09GRlNFVAo+ICAjZGVmaW5lIERQX0hEQ1BfMl8y
X0FLRV9TRU5EX0NFUlRfT0ZGU0VUCURQX0hEQ1BfMl8yX1JFR19DRVJUX1JYX09GRlNFVAo+IC0t
IAo+IDIuMjMuMAoKCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
