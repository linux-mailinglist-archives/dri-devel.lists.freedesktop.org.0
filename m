Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 067FA9969E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 16:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBEB6EB68;
	Thu, 22 Aug 2019 14:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2125F6EB6B;
 Thu, 22 Aug 2019 14:31:41 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 05:26:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; d="scan'208";a="196236911"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 22 Aug 2019 05:26:53 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 22 Aug 2019 15:26:52 +0300
Date: Thu, 22 Aug 2019 15:26:52 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: add rotation property
Message-ID: <20190822122652.GM5942@intel.com>
References: <20190822015756.30807-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190822015756.30807-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Fritz Koenig <frkoenig@google.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bruce Wang <bzwang@chromium.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMDY6NTc6MjRQTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9wbGFuZS5jIHwgMjAgKysrKysrKysrKysrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X3BsYW5lLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfcGxhbmUuYwo+IGluZGV4IDQ1YmZhYzllM2FmNy4uYzU2
NTM3NzFlOGZhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2Rw
dV9wbGFuZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X3BsYW5l
LmMKPiBAQCAtMTA0MCw4ICsxMDQwLDIxIEBAIHN0YXRpYyB2b2lkIGRwdV9wbGFuZV9zc3BwX2F0
b21pY191cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUpCj4gIAkJCQlwc3RhdGUtPm11bHRp
cmVjdF9tb2RlKTsKPiAgCj4gIAlpZiAocGRwdS0+cGlwZV9ody0+b3BzLnNldHVwX2Zvcm1hdCkg
ewo+ICsJCXVuc2lnbmVkIGludCByb3RhdGlvbjsKPiArCj4gIAkJc3JjX2ZsYWdzID0gMHgwOwo+
ICAKPiArCQlyb3RhdGlvbiA9IGRybV9yb3RhdGlvbl9zaW1wbGlmeShzdGF0ZS0+cm90YXRpb24s
Cj4gKwkJCQkJCSBEUk1fTU9ERV9ST1RBVEVfMCB8Cj4gKwkJCQkJCSBEUk1fTU9ERV9SRUZMRUNU
X1ggfAo+ICsJCQkJCQkgRFJNX01PREVfUkVGTEVDVF9ZKTsKPiArCj4gKwkJaWYgKHJvdGF0aW9u
ICYgRFJNX01PREVfUkVGTEVDVF9YKQo+ICsJCQlzcmNfZmxhZ3MgfD0gRFBVX1NTUFBfRkxJUF9V
RDsKPiArIAo+ICsJCWlmIChyb3RhdGlvbiAmIERSTV9NT0RFX1JFRkxFQ1RfWSkKPiArCQkJc3Jj
X2ZsYWdzIHw9IERQVV9TU1BQX0ZMSVBfTFI7Cj4gKwoKVUQgdnMuIExSIChhc3N1bWluZyB0aG9z
ZSBtZWFuIHdoYXQgSSB0aGluayB0aGV5IG1lYW4pIHNlZW0gdGhlIHdyb25nCndheSBhcm91bmQg
aGVyZS4KCj4KPiAgCQkvKiB1cGRhdGUgZm9ybWF0ICovCj4gIAkJcGRwdS0+cGlwZV9ody0+b3Bz
LnNldHVwX2Zvcm1hdChwZHB1LT5waXBlX2h3LCBmbXQsIHNyY19mbGFncywKPiAgCQkJCXBzdGF0
ZS0+bXVsdGlyZWN0X2luZGV4KTsKPiBAQCAtMTUyMiw2ICsxNTM1LDEzIEBAIHN0cnVjdCBkcm1f
cGxhbmUgKmRwdV9wbGFuZV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gIAlpZiAocmV0
KQo+ICAJCURQVV9FUlJPUigiZmFpbGVkIHRvIGluc3RhbGwgenBvcyBwcm9wZXJ0eSwgcmMgPSAl
ZFxuIiwgcmV0KTsKPiAgCj4gKwlkcm1fcGxhbmVfY3JlYXRlX3JvdGF0aW9uX3Byb3BlcnR5KHBs
YW5lLAo+ICsJCQlEUk1fTU9ERV9ST1RBVEVfMCwKPiArCQkJRFJNX01PREVfUk9UQVRFXzAgfAo+
ICsJCQlEUk1fTU9ERV9ST1RBVEVfMTgwIHwKPiArCQkJRFJNX01PREVfUkVGTEVDVF9YIHwKPiAr
CQkJRFJNX01PREVfUkVGTEVDVF9ZKTsKPiArCj4gIAlkcm1fcGxhbmVfZW5hYmxlX2ZiX2RhbWFn
ZV9jbGlwcyhwbGFuZSk7Cj4gIAo+ICAJLyogc3VjY2VzcyEgZmluYWxpemUgaW5pdGlhbGl6YXRp
b24gKi8KPiAtLSAKPiAyLjIxLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
