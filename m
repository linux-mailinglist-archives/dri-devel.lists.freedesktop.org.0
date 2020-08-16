Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA25245D29
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB0D6E4BA;
	Mon, 17 Aug 2020 07:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275B86E116
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 11:49:27 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id s81so2941386vkb.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 04:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5eLrFbLtX7LRVjQXLYXr7fYT+s3oj6NIOAVsECFxqKM=;
 b=VTj4qB+lGNX4zcJf2z0/eYjDFt/mU/QgCVjdHoJIkI0hWZ+9p0oSO+Y5WZXNC7HhF1
 5oa+J0NYTycEYumJdB9V7XA20vkYlT2hdTpbkYTEsrrYYsKSIfK+/eH4DJ3b5Rw6F7wg
 ospAHxJSgQr3MdA9AVAgL+FzP3xV2j2lkCQjv/2JwZ3mMDaR8Yy2WR+Y+HCibf+lrdm2
 ZoAwAJQEZ3zbcDKbBo5ZBe51Cm3S7mG6c5jgxnCgBc2ToNQziNS9z7mpQO5kcbcB8h8g
 ccq5PdZBZpo9Ewa7PNPgHk95HVokbez7C2uWx9pXLdwdr/6tZRVacEs0n1LBUnQlSAP5
 CZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5eLrFbLtX7LRVjQXLYXr7fYT+s3oj6NIOAVsECFxqKM=;
 b=azuKI8FXXP2mbnQv7GWzjbCRr5I9AgTArdDnKrSmlwV93SNQozXiQKomPsuntm1MH4
 VcAHhofwhkPbm08TQ3HBzrhJzZ59G3E87c0PMrZcFYckWEsI64Lwo1pHBT1WUUqb0W0y
 h4/m7OyJjGblmGGEV5yAVo7X+HyzIqbZQXlbs+r5s80P8wn6gCaZWLW4OrQH05442vYA
 vieH+GgoP/9LVOOPlJ4Fha+f9RCtlK57DEtxDqLd491xiP+E6OlpYrx91mzmxipdpQrj
 ksZNpiDHyHHY+xptBxUDbmb5AXRjSTm0Ph33uoITQ+70Gta//Uw0hW3O7GdbSX++6d/q
 i8lg==
X-Gm-Message-State: AOAM532s0sSBKw90R2zBIbF9fK/+7l0q7aX60VufVUXTFZlZ1ybpM3RP
 2nHMwgKSBLT46+oLKKWYSZjmApTmq8LoNMTNYFIifw==
X-Google-Smtp-Source: ABdhPJwcwv3PNq9HjzkX1STqOI4ekHlvvRz/TX9fSc2cBc4baD9/4PCjbazeZxB/c0C90LU+HNr2hgJW+Yady09XdOo=
X-Received: by 2002:a1f:9d85:: with SMTP id g127mr5522018vke.101.1597578566060; 
 Sun, 16 Aug 2020 04:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <1597134186-58423-1-git-send-email-tiantao6@hisilicon.com>
 <7b836643-82a6-667e-7ece-77797dc9ae3d@suse.de>
In-Reply-To: <7b836643-82a6-667e-7ece-77797dc9ae3d@suse.de>
From: Xinliang Liu <xinliang.liu@linaro.org>
Date: Sun, 16 Aug 2020 19:49:15 +0800
Message-ID: <CAKoKPbzZ+74MWqnvqAtfBtEYvoNpo2nxE6GqmY+gvuFPuy+XQQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Change maintainer for hisilicon DRM driver
To: Tian Tao <tiantao6@hisilicon.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:42 +0000
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
Cc: David Airlie <airlied@linux.ie>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxNCBBdWcgMjAyMCBhdCAxNToyNiwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+IHdyb3RlOgo+Cj4gSGksCj4KPiBhcyBhIGRyaXZlciBtYWludGFpbmVyLCB5
b3Ugc2hvdWxkIGhhdmUgY29tbWl0IGFjY2VzcyB0byBkcm0tbWlzYy4gSGVhZAo+IG92ZXIgdG8K
Pgo+ICAgaHR0cHM6Ly9kcm0ucGFnZXMuZnJlZWRlc2t0b3Aub3JnL21haW50YWluZXItdG9vbHMv
Y29tbWl0LWFjY2Vzcy5odG1sCj4KPiBmb3IgYSBkZXNjcmlwdGlvbiBvZiB3aGF0IHRoYXQgbWVh
bnMuIFRoZSBhY2NvdW50IGlzIHJlcXVlc3RlZCBhdAo+Cj4gICBodHRwczovL3d3dy5mcmVlZGVz
a3RvcC5vcmcvd2lraS9BY2NvdW50UmVxdWVzdHMvCj4KPiBhcyBkZXNjcmliZWQgdW5kZXIgJ0xl
Z2FjeSBTU0ggYWNjb3VudHMnLgo+Cj4gVGhlIGZpcnN0IHBhdGNoIHRvIGNvbW1pdCB3b3VsZCBi
ZSB5b3VyIGFwcG9pbnRtZW50IGFzIG1haW50YWluZXIgb2YKPiBoaXNpbGljb24uIDopCgpZZXMs
IGFmdGVyIHlvdSBnZXQgdGhlIGFjY2VzcyBvZiBkcm0tbWlzYy4gIEl0IG1pZ2h0IGJlIGhlbHBm
dWwgdG8KcmVhZGluZyB0aGUgZ3VpZGVsaW5lcyBvZiBkcm0tbWlzYy4KaHR0cHM6Ly9kcm0ucGFn
ZXMuZnJlZWRlc2t0b3Aub3JnL21haW50YWluZXItdG9vbHMvY29tbWl0dGVyLWRybS1taXNjLmh0
bWwKV2UgdXNlIGRpbSB0b29sIHRvIGNvbW1pdCBwYXRjaGVzIHRvIGRybS1taXNjLiBJdCdzIGdv
b2QgdG8gbGVhcm4gaG93CnRvIHVzZSBkaW0gdG9vbC4gUGxlYXNlIGFsc28gIHJlYWQgdGhlIGdl
dHRpbmcgc3RhcnQgZ3VpZGUKaHR0cHM6Ly9kcm0ucGFnZXMuZnJlZWRlc2t0b3Aub3JnL21haW50
YWluZXItdG9vbHMvZ2V0dGluZy1zdGFydGVkLmh0bWwKCkJlc3QsClhpbmxpYW5nCgo+Cj4gQmVz
dCByZWdhcmRzCj4gVGhvbWFzCj4KPiBBbSAxMS4wOC4yMCB1bSAxMDoyMyBzY2hyaWViIFRpYW4g
VGFvOgo+ID4gUmVtb3ZlIFJvbmdyb25nIFpvdSBhbmQgY2hhbmdlIHRpYW50YW8gYXMgaGlzaWxp
Y29uIERSTSBtYWludGFpbmVyLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFRpYW4gVGFvIDx0aWFu
dGFvNkBoaXNpbGljb24uY29tPgo+ID4gLS0tCj4gPiAgTUFJTlRBSU5FUlMgfCAyICstCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiA+IGluZGV4IGYxMmE4NjguLmY0
ZTQ5ZTAgMTAwNjQ0Cj4gPiAtLS0gYS9NQUlOVEFJTkVSUwo+ID4gKysrIGIvTUFJTlRBSU5FUlMK
PiA+IEBAIC01Njk0LDcgKzU2OTQsNyBAQCBGOiAgICAgIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAv
Cj4gPgo+ID4gIERSTSBEUklWRVJTIEZPUiBISVNJTElDT04KPiA+ICBNOiAgIFhpbmxpYW5nIExp
dSA8eGlubGlhbmcubGl1QGxpbmFyby5vcmc+Cj4gPiAtTTogICBSb25ncm9uZyBab3UgPHpvdXJv
bmdyb25nQGdtYWlsLmNvbT4KPiA+ICtNOiAgIFRpYW4gVGFvICA8dGlhbnRhbzZAaGlzaWxpY29u
LmNvbT4KPiA+ICBSOiAgIEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPgo+ID4g
IFI6ICAgWGlud2VpIEtvbmcgPGtvbmcua29uZ3hpbndlaUBoaXNpbGljb24uY29tPgo+ID4gIFI6
ICAgQ2hlbiBGZW5nIDxwdWNrLmNoZW5AaGlzaWxpY29uLmNvbT4KPiA+Cj4KPiAtLQo+IFRob21h
cyBaaW1tZXJtYW5uCj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcgo+IFNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSAo+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQo+IChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykKPiBHZXNjaMOkZnRzZsO8aHJlcjog
RmVsaXggSW1lbmTDtnJmZmVyCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
