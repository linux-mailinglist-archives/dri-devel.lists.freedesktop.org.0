Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 296CA56AF9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 15:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0EFC6E43D;
	Wed, 26 Jun 2019 13:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DD26E43C;
 Wed, 26 Jun 2019 13:43:33 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 06:43:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,420,1557212400"; d="scan'208";a="183175142"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 26 Jun 2019 06:43:30 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 26 Jun 2019 16:43:28 +0300
Date: Wed, 26 Jun 2019 16:43:28 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Subject: Re: [PATCH] drm/connector: Allow max possible encoders to attach to
 a connector
Message-ID: <20190626134328.GQ5942@intel.com>
References: <20190625234045.31321-1-dhinakaran.pandiyan@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625234045.31321-1-dhinakaran.pandiyan@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDQ6NDA6NDVQTSAtMDcwMCwgRGhpbmFrYXJhbiBQYW5k
aXlhbiB3cm90ZToKPiBDdXJyZW50bHkgd2UgcmVzdHJpY3QgdGhlIG51bWJlciBvZiBlbmNvZGVy
cyB0aGF0IGNhbiBiZSBsaW5rZWQgdG8KPiBhIGNvbm5lY3RvciB0byAzLCBpbmNyZWFzZSBpdCB0
byBtYXRjaCB0aGUgbWF4aW11bSBudW1iZXIgb2YgZW5jb2RlcnMKPiB0aGF0IGNhbiBiZSBpbml0
aWFsaXplZCAtIDMyLiBUaGUgY3VycmVudCBsaW1pdGF0aW9uIGxvb2tzIGFydGlmaWNpYWwuCj4g
SW5jcmVhc2luZyB0aGUgbGltaXQgdG8gMzIgZG9lcyBob3dldmVyIGluY3JlYXNlcyB0aGUgc2l6
ZSBvZiB0aGUgc3RhdGljCj4gdTMyIGFycmF5IGtlZXBpbmcgdHJhY2sgb2YgdGhlIGVuY29kZXIg
SURzLgo+IAo+IENjOiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNv
bT4KPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4K
PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IERo
aW5ha2FyYW4gUGFuZGl5YW4gPGRoaW5ha2FyYW4ucGFuZGl5YW5AaW50ZWwuY29tPgo+IC0tLQo+
ICBpbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2Ry
bS9kcm1fY29ubmVjdG9yLmggYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKPiBpbmRleCBj
YTc0NWQ5ZmVhZjUuLjkxNDU1YjRhOTM2MCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1f
Y29ubmVjdG9yLmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKPiBAQCAtMTI3
OCw3ICsxMjc4LDcgQEAgc3RydWN0IGRybV9jb25uZWN0b3Igewo+ICAJLyoqIEBvdmVycmlkZV9l
ZGlkOiBoYXMgdGhlIEVESUQgYmVlbiBvdmVyd3JpdHRlbiB0aHJvdWdoIGRlYnVnZnMgZm9yIHRl
c3Rpbmc/ICovCj4gIAlib29sIG92ZXJyaWRlX2VkaWQ7Cj4gIAo+IC0jZGVmaW5lIERSTV9DT05O
RUNUT1JfTUFYX0VOQ09ERVIgMwo+ICsjZGVmaW5lIERSTV9DT05ORUNUT1JfTUFYX0VOQ09ERVIg
MzIKPiAgCS8qKgo+ICAJICogQGVuY29kZXJfaWRzOiBWYWxpZCBlbmNvZGVycyBmb3IgdGhpcyBj
b25uZWN0b3IuIFBsZWFzZSBvbmx5IHVzZQo+ICAJICogZHJtX2Nvbm5lY3Rvcl9mb3JfZWFjaF9w
b3NzaWJsZV9lbmNvZGVyKCkgdG8gZW51bWVyYXRlIHRoZXNlLgoKSSB3b25kZXIgaWYgd2UgY291
bGRuJ3QganVzdCByZXBsYWNlIHRoaXMgYXJyYXkgd2l0aCBhIGJpdG1hc2s/CkkgdGhpbmsgdGhl
IGZvcl9lYWNoX3Bvc3NpYmxlX2VuY29kZXIoKSB0aGluZyBJIGRpZCBhIHdoaWxlIGJhY2sKc2hv
dWxkIG1ha2UgdGhpcyBlYXNpZXIgcG90ZW50aWFsbHkgYmVjYXVzZSBtb3N0IGRyaXZlciBjb2Rl
IGp1c3QKdXNlcyB0aGF0LgoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
