Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CDC42A61
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 17:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65B9894FF;
	Wed, 12 Jun 2019 15:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64252894FF
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 15:09:32 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id D060B8036E;
 Wed, 12 Jun 2019 17:09:28 +0200 (CEST)
Date: Wed, 12 Jun 2019 17:09:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm: Tweak drm_encoder_helper_funcs.enable kerneldoc
Message-ID: <20190612150927.GA5030@ravnborg.org>
References: <20190612150038.194843-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190612150038.194843-1-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=cm27Pg_UAAAA:8
 a=e5mUnYsNAAAA:8 a=7gkXJVJtAAAA:8 a=sAVnlTNQSPMx3Tj0RkkA:9
 a=CjuIK1q_8ugA:10 a=xmb-EsYY8bH0VWELuYED:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTE6MDA6MzRBTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IEkgY29waWVk
IHRoZSBrZXJuZWxkb2MgZm9yIGVuY29kZXJfZnVuY3MuYXRvbWljX2VuYWJsZSBmcm9tIGVuY29k
ZXJfZnVuY3MuZW5hYmxlCj4gaW4gYSByZWNlbnQgcGF0Y2ggWzFdLiBTYW0gcmlnaHRseSBwb2lu
dGVkIG91dCBpbiB0aGUgcmV2aWV3IHRoYXQgImZvciBzeW1tZXRyeQo+IHdpdGgiIHRleHQgaXMg
YXdrd2FyZCBbMl0uIFNvIGhlcmUncyBhIHBhdGNoIHRvIGZpeCB1cCB0aGUgc291cmNlIG9mIHRo
ZSBhd2t3YXJkCj4gbGFuZ3VhZ2UuCgpMb29rcyBnb29kLgo+IAo+IFsxXSBodHRwczovL3BhdGNo
d29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTA2MTExNjA4NDQuMjU3NDk4LTIt
c2VhbkBwb29ybHkucnVuCj4gWzJdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9w
YXRjaC9tc2dpZC8yMDE5MDYxMTE4NTM1Mi5HQTE2MzA1QHJhdm5ib3JnLm9yZwo+IAo+IFN1Z2dl
c3RlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IFNpZ25lZC1vZmYtYnk6
IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgpSZXZpZXdlZC1ieTogU2FtIFJhdm5i
b3JnIDxzYW1AcmF2bmJvcmcub3JnPgoKPiAtLS0KPiAgaW5jbHVkZS9kcm0vZHJtX21vZGVzZXRf
aGVscGVyX3Z0YWJsZXMuaCB8IDEwICsrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0v
ZHJtX21vZGVzZXRfaGVscGVyX3Z0YWJsZXMuaCBiL2luY2x1ZGUvZHJtL2RybV9tb2Rlc2V0X2hl
bHBlcl92dGFibGVzLmgKPiBpbmRleCBmOWM5NGMyYTEzNjQ2Li5kZjgwMTMxYmIxMGZjIDEwMDY0
NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9tb2Rlc2V0X2hlbHBlcl92dGFibGVzLmgKPiArKysg
Yi9pbmNsdWRlL2RybS9kcm1fbW9kZXNldF9oZWxwZXJfdnRhYmxlcy5oCj4gQEAgLTcxOSwxMSAr
NzE5LDExIEBAIHN0cnVjdCBkcm1fZW5jb2Rlcl9oZWxwZXJfZnVuY3Mgewo+ICAJICogaG9va3Mg
YW5kIGNhbGwgdGhlbSBmcm9tIENSVEMncyBjYWxsYmFjayBieSBsb29waW5nIG92ZXIgYWxsIGVu
Y29kZXJzCj4gIAkgKiBjb25uZWN0ZWQgdG8gaXQgdXNpbmcgZm9yX2VhY2hfZW5jb2Rlcl9vbl9j
cnRjKCkuCj4gIAkgKgo+IC0JICogVGhpcyBob29rIGlzIHVzZWQgb25seSBieSBhdG9taWMgaGVs
cGVycywgZm9yIHN5bW1ldHJ5IHdpdGggQGRpc2FibGUuCj4gLQkgKiBBdG9taWMgZHJpdmVycyBk
b24ndCBuZWVkIHRvIGltcGxlbWVudCBpdCBpZiB0aGVyZSdzIG5vIG5lZWQgdG8KPiAtCSAqIGVu
YWJsZSBhbnl0aGluZyBhdCB0aGUgZW5jb2RlciBsZXZlbC4gVG8gZW5zdXJlIHRoYXQgcnVudGlt
ZSBQTSBoYW5kbGluZwo+IC0JICogKHVzaW5nIGVpdGhlciBEUE1TIG9yIHRoZSBuZXcgIkFDVElW
RSIgcHJvcGVydHkpIHdvcmtzCj4gLQkgKiBAZW5hYmxlIG11c3QgYmUgdGhlIGludmVyc2Ugb2Yg
QGRpc2FibGUgZm9yIGF0b21pYyBkcml2ZXJzLgo+ICsJICogVGhpcyBob29rIGlzIG9ubHkgdXNl
ZCBieSBhdG9taWMgaGVscGVycywgaXQgaXMgdGhlIG9wcG9zaXRlIG9mCj4gKwkgKiBAZGlzYWJs
ZS4gQXRvbWljIGRyaXZlcnMgZG9uJ3QgbmVlZCB0byBpbXBsZW1lbnQgaXQgaWYgdGhlcmUncyBu
bwo+ICsJICogbmVlZCB0byBlbmFibGUgYW55dGhpbmcgYXQgdGhlIGVuY29kZXIgbGV2ZWwuIFRv
IGVuc3VyZSB0aGF0Cj4gKwkgKiBydW50aW1lIFBNIGhhbmRsaW5nICh1c2luZyBlaXRoZXIgRFBN
UyBvciB0aGUgbmV3ICJBQ1RJVkUiIHByb3BlcnR5KQo+ICsJICogd29ya3MgQGVuYWJsZSBtdXN0
IGJlIHRoZSBpbnZlcnNlIG9mIEBkaXNhYmxlIGZvciBhdG9taWMgZHJpdmVycy4KPiAgCSAqLwo+
ICAJdm9pZCAoKmVuYWJsZSkoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKTsKPiAgCj4gLS0g
Cj4gU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
