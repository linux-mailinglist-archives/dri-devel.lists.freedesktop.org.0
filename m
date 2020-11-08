Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C5E2AA8F1
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 04:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B579F6E073;
	Sun,  8 Nov 2020 03:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C5F6E073
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Nov 2020 03:05:11 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A69A208C7
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Nov 2020 03:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604804711;
 bh=HwITghqppKFjK26HFNkFvXzdMOfxOTH9bRWvBg0QmDA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zew6Y5tgnmqimVGmhjui7F7w76KEAdyNu1Za/9t6I8gjZdqmAfTRoPh9BQvwRd2po
 yJBMALuqPFJQq4IejLTs6CIemdiI0+NiWHGJrsSyBjBFZq+AxlZDYivbjT/6BG9QfJ
 wt7WfgSnjIiVG7oFEV59dfnvP1IEeXVLiri1HdoQ=
Received: by mail-ej1-f47.google.com with SMTP id w13so7370271eju.13
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Nov 2020 19:05:11 -0800 (PST)
X-Gm-Message-State: AOAM5303YcN3HKWIAoFMc7C2fS0gA54Y5d9OWPfSFVICRg9u/ZSw4wgh
 CP6JJc+B43cTf0WaKi+gMYrsmAWO55Ikua9Z6g==
X-Google-Smtp-Source: ABdhPJzbNJEGNS5slZvCdTXT5PYfqc0qF0yuXh8J6e6Kixynl26cfxzASzgrH63HJNSCBrDaCRKHuQZqNbURrIa1gHw=
X-Received: by 2002:a17:906:6d0:: with SMTP id
 v16mr8726811ejb.310.1604804709851; 
 Sat, 07 Nov 2020 19:05:09 -0800 (PST)
MIME-Version: 1.0
References: <20201029152702.533-1-chunkuang.hu@kernel.org>
 <20201029152702.533-4-chunkuang.hu@kernel.org>
In-Reply-To: <20201029152702.533-4-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 8 Nov 2020 11:04:59 +0800
X-Gmail-Original-Message-ID: <CAAOTY__ZRLubBfNtMFMax8SubM9f9iKLXGzS+bXseXcd9V0Smg@mail.gmail.com>
Message-ID: <CAAOTY__ZRLubBfNtMFMax8SubM9f9iKLXGzS+bXseXcd9V0Smg@mail.gmail.com>
Subject: Re: [PATCH 3/3] MAINTAINERS: add files for Mediatek DRM drivers
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KyBWaW5vZDoKCkhpLCBDaHVuZmVuZzoKCkNodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJu
ZWwub3JnPiDmlrwgMjAyMOW5tDEw5pyIMjnml6Ug6YCx5ZubIOS4i+WNiDExOjI45a+r6YGT77ya
Cj4KPiBNZWRpYXRlayBNSVBJIERTSSBwaHkgZHJpdmVyIGlzIG1vdmVkIGZyb20gZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrIHRvCj4gZHJpdmVycy9waHkvbWVkaWF0ZWssIHNvIGFkZCB0aGUgbmV3
IGZvbGRlciB0byB0aGUgTWVkaWF0ZWsgRFJNIGRyaXZlcnMnCj4gaW5mb3JtYXRpb24uCgpXb3Vs
ZCB5b3UgbGlrZSB0aGlzIHBhdGNoPyBJZiBzbywgeW91IGNvdWxkIGdpdmUgYW4gYWNrZWQtYnkg
dGFnIG9uCnRoaXMgcGF0Y2gsIHNvIEkgY291bGQgYXBwbGllZCB0aGUgd2hvbGUgc2VyaWVzIGlu
dG8gbXkgdHJlZS4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2h1
bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gLS0tCj4gIE1BSU5UQUlORVJT
IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBh
L01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiBpbmRleCBlNzM2MzZiNzVmMjkuLjE0ZjUwMThj
MDFiNiAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAg
LTU4NjcsNiArNTg2Nyw3IEBAIFM6ICAgICAgICBTdXBwb3J0ZWQKPiAgRjogICAgIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrLwo+ICBGOiAgICAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrLwo+ICBGOiAgICAgZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5
LW10ay1oZG1pKgo+ICtGOiAgICAgZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1taXBpKgo+
Cj4gIERSTSBEUklWRVJTIEZPUiBOVklESUEgVEVHUkEKPiAgTTogICAgIFRoaWVycnkgUmVkaW5n
IDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+Cj4gLS0KPiAyLjE3LjEKPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
