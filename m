Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3597E99648
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 16:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C0B6EB58;
	Thu, 22 Aug 2019 14:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0D56EB54
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 14:20:57 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 05:28:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; d="scan'208";a="190566346"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 22 Aug 2019 05:28:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 22 Aug 2019 15:28:38 +0300
Date: Thu, 22 Aug 2019 15:28:38 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 10/10] dma-buf/resv: add other operations
Message-ID: <20190822122838.GN5942@intel.com>
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <20190821123147.110736-11-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821123147.110736-11-christian.koenig@amd.com>
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMDI6MzE6NDdQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBBZGRpdGlvbmFsIHRvIHJlYWRlcnMgYW5kIHdyaXRlcnMgYWRkIGFub3RoZXIg
Y2xhc3Mgb2Ygb3BlcmF0aW9ucwo+IHdoaWNoIG5ldmVyIHBhcnRpY2lwYXRlIGluIGltcGxpY2l0
IHN5bmNocm9uaXphdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVz
di5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrLS0tCj4gIGluY2x1ZGUvbGludXgvZG1h
LXJlc3YuaCAgIHwgIDIgKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLXJlc3Yu
YyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jCj4gaW5kZXggOGVmN2RiYzdmZDhlLi5jNmRk
NmMzNmRiYTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMKPiArKysg
Yi9kcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYwo+IEBAIC0yODAsNiArMjgwLDcgQEAgdm9pZCBk
bWFfcmVzdl9pbml0KHN0cnVjdCBkbWFfcmVzdiAqb2JqKQo+ICAKPiAgCWRtYV9yZXN2X2ZlbmNl
c19pbml0KCZvYmotPndyaXRlcnMpOwo+ICAJZG1hX3Jlc3ZfZmVuY2VzX2luaXQoJm9iai0+cmVh
ZGVycyk7Cj4gKwlkbWFfcmVzdl9mZW5jZXNfaW5pdCgmb2JqLT5vdGhlcnMpOwo+ICB9Cj4gIEVY
UE9SVF9TWU1CT0woZG1hX3Jlc3ZfaW5pdCk7Cj4gIAo+IEBAIC0yOTUsNiArMjk2LDcgQEAgdm9p
ZCBkbWFfcmVzdl9maW5pKHN0cnVjdCBkbWFfcmVzdiAqb2JqKQo+ICAJICovCj4gIAlkbWFfcmVz
dl9mZW5jZXNfZmluaSgmb2JqLT53cml0ZXJzKTsKPiAgCWRtYV9yZXN2X2ZlbmNlc19maW5pKCZv
YmotPnJlYWRlcnMpOwo+ICsJZG1hX3Jlc3ZfZmVuY2VzX2ZpbmkoJm9iai0+b3RoZXJzKTsKPiAg
CXd3X211dGV4X2Rlc3Ryb3koJm9iai0+bG9jayk7Cj4gIH0KPiAgRVhQT1JUX1NZTUJPTChkbWFf
cmVzdl9maW5pKTsKPiBAQCAtMzM0LDYgKzMzNiwxMCBAQCB2b2lkIGRtYV9yZXN2X3BydW5lX2Zl
bmNlcyhzdHJ1Y3QgZG1hX3Jlc3YgKm9iaikKPiAgCWZlbmNlID0gZG1hX3Jlc3ZfZmVuY2VzX2Rl
cmVmKG9iaiwgJm9iai0+cmVhZGVycyk7Cj4gIAlpZiAoZG1hX2ZlbmNlX2lzX3NpZ25hbGVkKGZl
bmNlKSkKPiAgCQlkbWFfcmVzdl9mZW5jZXNfc2V0KG9iaiwgJm9iai0+cmVhZGVycywgTlVMTCk7
Cj4gKwo+ICsJZmVuY2UgPSBkbWFfcmVzdl9mZW5jZXNfZGVyZWYob2JqLCAmb2JqLT5vdGhlcnMp
Owo+ICsJaWYgKGRtYV9mZW5jZV9pc19zaWduYWxlZChmZW5jZSkpCj4gKwkJZG1hX3Jlc3ZfZmVu
Y2VzX3NldChvYmosICZvYmotPm90aGVycywgTlVMTCk7Cj4gIH0KPiAgRVhQT1JUX1NZTUJPTChk
bWFfcmVzdl9wcnVuZV9mZW5jZXMpOwo+ICAKPiBAQCAtMzQ2LDE3ICszNTIsMTkgQEAgRVhQT1JU
X1NZTUJPTChkbWFfcmVzdl9wcnVuZV9mZW5jZXMpOwo+ICAqLwo+ICBpbnQgZG1hX3Jlc3ZfY29w
eV9mZW5jZXMoc3RydWN0IGRtYV9yZXN2ICpkc3QsIHN0cnVjdCBkbWFfcmVzdiAqc3JjKQo+ICB7
Cj4gLQlzdHJ1Y3QgZG1hX2ZlbmNlICp3cml0ZXJzLCAqcmVhZGVyczsKPiArCXN0cnVjdCBkbWFf
ZmVuY2UgKndyaXRlcnMsICpyZWFkZXJzLCAqb3RoZXJzOwo+ICAKPiAgCWRtYV9yZXN2X2Fzc2Vy
dF9oZWxkKGRzdCk7Cj4gIAo+ICAJcmN1X3JlYWRfbG9jaygpOwo+ICAJd3JpdGVycyA9IGRtYV9y
ZXN2X2ZlbmNlc19nZXRfcmN1KCZzcmMtPndyaXRlcnMpOwo+ICAJcmVhZGVycyA9IGRtYV9yZXN2
X2ZlbmNlc19nZXRfcmN1KCZzcmMtPnJlYWRlcnMpOwo+ICsJb3RoZXJzID0gZG1hX3Jlc3ZfZmVu
Y2VzX2dldF9yY3UoJnNyYy0+b3RoZXJzKTsKPiAgCXJjdV9yZWFkX3VubG9jaygpOwo+ICAKPiAg
CWRtYV9yZXN2X2ZlbmNlc19zZXQoZHN0LCAmZHN0LT53cml0ZXJzLCB3cml0ZXJzKTsKPiAgCWRt
YV9yZXN2X2ZlbmNlc19zZXQoZHN0LCAmZHN0LT5yZWFkZXJzLCByZWFkZXJzKTsKPiArCWRtYV9y
ZXN2X2ZlbmNlc19zZXQoZHN0LCAmZHN0LT5yZWFkZXJzLCBvdGhlcnMpOwogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5eCgpvdGhlcnM/CgoKLS0gClZpbGxlIFN5
cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
