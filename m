Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3E2B8180
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 21:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7106EE4D;
	Thu, 19 Sep 2019 19:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7180D6F9F2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 19:38:24 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id k9so3771806oib.7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 12:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3hooRbQOXThoD96PStoDLteQkM6Vo3aV1c9n1eXpOzY=;
 b=QW2NRcsH8r4Ro7UXwWx9oN9m0BIEAT2xvu6BBopB0FvZbl86aRIJ4UIrDYsRisZi1y
 JDwOkDPGiw3B7lBf47jPUR7TUBSFSI6Z4Uv8A7JzbFmO7Buk0O8LW7b/5TskxCf7TGXQ
 F2tWCnXjEtWEFk0FYkDCYxV8G00TTCF0bHDWbcaoCuJ+Mv/8Zwk83Wmos2ldv/JLKddt
 Pt4kg6smEGIqhQhU8cg5hSkHVFGAAFEjI+zd0/ccrpTS/NBS1eC36pSbJb5u8JWibQS6
 eWwVASSIb2xp+K+egchLFT+pRtJ/zhc5QS4Ve7gnY7pFZaWFC0Q20zEAy8GVhvKhbknr
 AwZQ==
X-Gm-Message-State: APjAAAWuDLr+MnxZOxXlO6ar9eJzaXinIwMB/9L1m2Leh/8QuHKtpoQy
 OPcmlZZWjzeYOxqIxf//z421b9MX5jI/okxQcBVuvA==
X-Google-Smtp-Source: APXvYqzEjvYJG/4MaWUnm0x7UI/AOE5Zw0CHgNLOOItK4ERCBQuZ2DPnHRvhm+yqatUnqSEktURuPPLsmZtTLT0DLZM=
X-Received: by 2002:aca:578a:: with SMTP id l132mr3678488oib.14.1568921903605; 
 Thu, 19 Sep 2019 12:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190919173020.11655-1-mripard@kernel.org>
 <CAGb2v65xgCC99x2SZG84n0mp7B7W5EDVDTgRrvQgdvVXAUxN5A@mail.gmail.com>
In-Reply-To: <CAGb2v65xgCC99x2SZG84n0mp7B7W5EDVDTgRrvQgdvVXAUxN5A@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 19 Sep 2019 21:38:11 +0200
Message-ID: <CAKMK7uF2tvgfYL0RX828tjOuOmU2+4bi+JSF5meieVbwsgU2yA@mail.gmail.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: Update Allwinner DRM drivers entry
To: Chen-Yu Tsai <wens@csie.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=3hooRbQOXThoD96PStoDLteQkM6Vo3aV1c9n1eXpOzY=;
 b=HEPKFIc+NTdJlttbJ4fkdQ2EHPNIAm5PuMfakZz9CcGm2tAYrFpf4hx0n7PldhnuVf
 egOVV9VCjA58OBhbaFeVwszwtBL6+yhpmcMN8/m+cUshKTWf4MDsj87db63fBHPpvr2n
 7bnuZEGmjxJ94y/Nsa7E3XyUIXgjQnjealCTw=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgNzozNiBQTSBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5v
cmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgMTozMCBBTSBNYXhpbWUgUmlw
YXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IFRoZSBEUk0gZHJpdmVycyBh
cmUgbW9yZSB0aGFuIGFib3V0IHRoZSBBMTAgbm93LCBzbyBsZXQncyBtYWtlIHRoZSBlbnRyeQo+
ID4gbmFtZSBhIGJpdCBtb3JlIGdlbmVyaWMuCj4gPgo+ID4gQWxzbywgQ2hlbi1ZdSBoYXMgYmVl
biBhIGRlLWZhY3RvIG1haW50YWluZXIgZm9yIHRoZSBEUk0gZHJpdmVyIGZvciBhCj4gPiB3aGls
ZSwgaXMgYSBtYWludGFpbmVyIG9mIHRoZSBBbGx3aW5uZXIgcGxhdGZvcm0gZm9yIGFuIGV2ZW4g
bG9uZ2VyIHRpbWUsCj4gPiBhbmQgaGFzIGRybS1taXNjIGNvbW1pdCBhY2Nlc3MuIExldCdzIG1h
a2UgaXQgZm9ybWFsIGFuZCBhZGQgaGltIGFzIGEKPgo+IEFsdGhvdWdoIEkgaGF2ZSBhbiBhY2Nv
dW50LCBJIGhhdmVuJ3QgYWN0dWFsbHkgdHJpZWQgaWYgSSBoYXZlIGNvbW1pdCBhY2Nlc3MuCj4g
SSBhbHNvIGRvbid0IHRoaW5rIG15IGFjY291bnQgd2FzIHByb3Blcmx5IG1pZ3JhdGVkIG92ZXIg
dG8gR2l0TGFiLCBhcyBJCj4gaGFkIHRvIHJlLWNyZWF0ZSBvbmUuCgpUaGUgZ2l0IHJlcG8gaXMg
c3RpbGwgb24gbGVnYWN5IGdpdCBmZC5vIHNlcnZlcnMsIGl0J3Mgbm90IHlldAptaWdyYXRlZCBv
dmVyIHRvIGdpdGxhYi4KLURhbmllbAoKPgo+ID4gbWFpbnRhaW5lci4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4KPiBBY2tlZC1ieTog
Q2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgo+Cj4gPiAtLS0KPiA+ICBNQUlOVEFJTkVSUyB8
IDMgKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gPiBpbmRl
eCBiMjMyNmRlY2UyOGUuLjU0ZTIyMmUxZDBkNiAxMDA2NDQKPiA+IC0tLSBhL01BSU5UQUlORVJT
Cj4gPiArKysgYi9NQUlOVEFJTkVSUwo+ID4gQEAgLTUzNTIsOCArNTM1Miw5IEBAIEY6ICAgICAg
ICBpbmNsdWRlL2RybS9kcm0qCj4gPiAgRjogICAgIGluY2x1ZGUvdWFwaS9kcm0vZHJtKgo+ID4g
IEY6ICAgICBpbmNsdWRlL2xpbnV4L3ZnYSoKPiA+Cj4gPiAtRFJNIERSSVZFUlMgRk9SIEFMTFdJ
Tk5FUiBBMTAKPiA+ICtEUk0gRFJJVkVSUyBGT1IgQUxMV0lOTkVSIFNPQ1MKPiA+ICBNOiAgICAg
TWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgo+ID4gK006ICAgICBDaGVuLVl1IFRz
YWkgPHdlbnNAY3NpZS5vcmc+Cj4gPiAgTDogICAgIGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiA+ICBTOiAgICAgU3VwcG9ydGVkCj4gPiAgRjogICAgIGRyaXZlcnMvZ3B1L2RybS9z
dW40aS8KPiA+IC0tCj4gPiAyLjIxLjAKPiA+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVu
Z2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9i
bG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
