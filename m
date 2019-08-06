Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DF58338F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 16:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DA36E39E;
	Tue,  6 Aug 2019 14:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903056E39E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 14:07:18 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n1so1761439wrw.12
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 07:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AMijbDFtoxyokrB8u7XqfTBXaTic+Bs3MV51js3gn+o=;
 b=QtETAB5BKDpOb740bXA2FoN9WA6YiLrRxMworGDbHdnlzly5M3gl2WJTtUmvHuMaCU
 7XDUfHIfzOL6Kaf9jE0CbAKPnQgtUvquo6DTqRpsiXxaKYaYHa76ADjT7ccqpIBnLDAs
 1WjpBpNAr6l4/QSfhupX9mmxXPeQdbfHuyBFIleTJNg4bY1C+ERCr/PY8EH8hHNq1bcq
 5usyefJKDBIwEJSIdji8IL/TtmcWKRlKnza1Ph5seZveDc0G2s9dyh+Yp6kEwKNBumxO
 nUP5SiA+jcaz2jOtgI//60bAkusrHlTb3KGXGeKD7Q/lx0e83m+5SkUBn5JFknxQkj2d
 Zjjg==
X-Gm-Message-State: APjAAAU2qftrgIlVCtgdb/EsGfkSYJG82bOP31sogFbgOG24RULZMnVy
 ZmoB4aI93t0zsSvRZI2F72xyN3ZbtWn5zkKbPfE=
X-Google-Smtp-Source: APXvYqwYTpsagYVf72AUm/x4PQPT4QM5sm3iT/4CtAyFGHHzLqhUSM0PkWVDJbvbHe9O0aSvLxLiM3TTYrCC7yhHUGM=
X-Received: by 2002:a5d:6ccd:: with SMTP id c13mr5339826wrc.4.1565100437160;
 Tue, 06 Aug 2019 07:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190704063220.2193-1-oded.gabbay@gmail.com>
 <5051abd5-7259-c216-6de7-1fa927ec45b9@amd.com>
In-Reply-To: <5051abd5-7259-c216-6de7-1fa927ec45b9@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 6 Aug 2019 10:07:05 -0400
Message-ID: <CADnq5_NCY+kDK3fcaeoH4E3P3yXajj-pra3dg411Zbgjks8Qdw@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: update amdkfd maintainer
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=AMijbDFtoxyokrB8u7XqfTBXaTic+Bs3MV51js3gn+o=;
 b=XBj9TjrTxKdEuS8FzXTNZUQ/MejUkvmI+0f7KodiCKViSelvpk1mpRmdKUKbkbDjAM
 YjyleQ5zGYypidKg/B2C/ifYl/bqbJWoqPHcxM41uayEwNRn25f+B8cuW2tYHRwSJkAS
 FLXeoogN8MYXrK6chG19pYbrAp30duSPpPPsm9FXxheZLCDROSDh2c2YL7NeJ98WA3QV
 LgEpw0PbeCy9dQUpTJ3GqJuK4tMOUsHI+XTUbNg7iZwa7MkbLOcNtt7EcEgTRgu2SeRO
 7k2NAJd/hFjfckJW15tLzb3YEo8g+FObH8bIsyLqRWtjAtLbpXsrnYzPwsTQLj6xrHR8
 pfkw==
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgNCwgMjAxOSBhdCAxMjo1OCBQTSBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1
ZWhsaW5nQGFtZC5jb20+IHdyb3RlOgo+Cj4gT24gMjAxOS0wNy0wNCAyOjMyIGEubS4sIE9kZWQg
R2FiYmF5IHdyb3RlOgo+ID4gSSdtIGxlYXZpbmcgdGhlIHJvbGUgb2YgYW1ka2ZkIG1haW50YWlu
ZXIuIFRoZXJlZm9yZSwgdXBkYXRlIHRoZSByZWxldmFudAo+ID4gZW50cnkgaW4gdGhlIE1BSU5U
QUlORVJTIGZpbGUgd2l0aCB0aGUgbmFtZSBvZiB0aGUgbmV3IG1haW50YWluZXIuCj4gPgo+ID4g
R29vZCBMdWNrIQo+Cj4gVGhhbmsgeW91IE9kZWQhIFRoYW5rcyBmb3IgYmVpbmcgdGhlIG1haW50
YWluZXIgZXZlbiBhZnRlciBsZWF2aW5nIEFNRAo+IGFuZCBoZWxwaW5nIG1lIHRyYW5zaXRpb24g
aW50byB0aGUgbWFpbnRhaW5lciByb2xsLiBBbGwgdGhlIGJlc3QgdG8geW91Lgo+Cj4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBPZGVkIEdhYmJheSA8b2RlZC5nYWJiYXlAZ21haWwuY29tPgo+Cj4g
UmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgo+Cj4K
PiA+IC0tLQo+ID4gICBNQUlOVEFJTkVSUyB8IDQgKystLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9NQUlO
VEFJTkVSUyBiL01BSU5UQUlORVJTCj4gPiBpbmRleCAwMWE1MmZjOTY0ZGEuLjlhNmMxNWZhNWZk
NSAxMDA2NDQKPiA+IC0tLSBhL01BSU5UQUlORVJTCj4gPiArKysgYi9NQUlOVEFJTkVSUwo+ID4g
QEAgLTgyMSw5ICs4MjEsOSBAQCBGOiAgICAgICAgZHJpdmVycy9pb21tdS9hbWRfaW9tbXUqLltj
aF0KPiA+ICAgRjogIGluY2x1ZGUvbGludXgvYW1kLWlvbW11LmgKPiA+Cj4gPiAgIEFNRCBLRkQK
PiA+IC1NOiAgIE9kZWQgR2FiYmF5IDxvZGVkLmdhYmJheUBnbWFpbC5jb20+Cj4gPiArTTogICBG
ZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPiA+ICAgTDogIGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPgo+IFdoaWxlIEknbSBsb29raW5nIGF0IHRoZSBNQUlO
VEFJTkVSUyBmaWxlLCBJIHRoaW5rIHdlIHNob3VsZCBjaGFuZ2UgdGhpcwo+IHRvIGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnLiBJIG1heSBhbHNvIHVwZGF0ZSB0aGUgZmlsZSBsaXN0IHdp
dGhlCj4gc29tZSB3aWxkIGNhcmRzIHRvIGNhdGNoIGFsbCBjdXJyZW50IGFuZCBmdXR1cmUgYW1k
Z3B1X2FtZGtmZCouW2NoXQo+IGZpbGVzLiBJdCdzIGN1cnJlbnRseSBtaXNzaW5nIGFtZGdwdV9h
bWRrZmRfZ2Z4X3YxMC5jLgo+CgpBcHBsaWVkIGFuZCB1cGRhdGVkIHRoZSBtYWlsaW5nIGxpc3Qg
YW5kIGZpbGVzLgoKVGhhbmtzIQoKQWxleAoKPiBSZWdhcmRzLAo+ICAgIEZlbGl4Cj4KPgo+ID4g
LVQ6ICAgZ2l0IGdpdDovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfmdhYmJheW8vbGludXguZ2l0
Cj4gPiArVDogICBnaXQgZ2l0Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYvbGludXgK
PiA+ICAgUzogIFN1cHBvcnRlZAo+ID4gICBGOiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FtZGtmZC5jCj4gPiAgIEY6ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfYW1ka2ZkLmgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
