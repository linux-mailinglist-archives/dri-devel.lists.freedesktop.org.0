Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111C92570F9
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 01:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323FF89D7B;
	Sun, 30 Aug 2020 23:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C8D89D7B
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 23:04:00 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9699C20DD4
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 23:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598828640;
 bh=DBjDH6+zNvjW34pmAg6ijFdsfR7eAU1XQ0DB71Y2mMc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AdG2GicfwHXYVdmq7SKuxLonnI4a9+7yvIkyYxp3DjSRp7aFPuweycg9/1ITRS7oY
 nzNBkUZh/wFOSW1SL7FnH6wiO7DWC6oiyAr08piI9cqjGjOXzRqxdSHk4WpQRfh4mG
 efpT+VfmT+dJ8fr90dngXby4e/RbnbEu5Bb0GC7o=
Received: by mail-ed1-f43.google.com with SMTP id ba12so3804248edb.2
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 16:04:00 -0700 (PDT)
X-Gm-Message-State: AOAM532gkOMI8jSfUK21EujrWGAk3+uHlQ6ZwbDV3/fh3OtLknz3OZWT
 mVrEo2x51J35lkGZC0YiAJitXI7bXaZMFeFOYw==
X-Google-Smtp-Source: ABdhPJyrriOATdP4S++pL2NTqHge5RYs7u29ox2n6iMcVOciI+MvuGLn2MncSErExi+ry6qYh9bfMAMxiAAU5uTIJCs=
X-Received: by 2002:a05:6402:7d1:: with SMTP id
 u17mr8802306edy.48.1598828639253; 
 Sun, 30 Aug 2020 16:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200823014830.15962-1-chunkuang.hu@kernel.org>
 <20200823014830.15962-5-chunkuang.hu@kernel.org>
In-Reply-To: <20200823014830.15962-5-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 31 Aug 2020 07:03:47 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8_GFMa9R5CP_Vy6g3E3vEJ4qvCbZ=2vkafh4+4NTziLw@mail.gmail.com>
Message-ID: <CAAOTY_8_GFMa9R5CP_Vy6g3E3vEJ4qvCbZ=2vkafh4+4NTziLw@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] MAINTAINERS: add files for Mediatek DRM drivers
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
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIENodW5mZW5nICYgS2lzaG9uOgoKSG93IGRvIHlvdSBmZWVsIGFib3V0IHRoaXMgcGF0Y2g/
CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5l
bC5vcmc+IOaWvCAyMDIw5bm0OOaciDIz5pelIOmAseaXpSDkuIrljYg5OjQ45a+r6YGT77yaCj4K
PiBNZWRpYXRlayBIRE1JIHBoeSBkcml2ZXIgaXMgbW92ZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsgdG8KPiBkcml2ZXJzL3BoeS9tZWRpYXRlaywgc28gYWRkIHRoZSBuZXcgZm9sZGVy
IHRvIHRoZSBNZWRpYXRlayBEUk0gZHJpdmVycycKPiBpbmZvcm1hdGlvbi4KPgo+IFNpZ25lZC1v
ZmYtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+IFJldmlld2Vk
LWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPgo+IC0tLQo+ICBN
QUlOVEFJTkVSUyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRp
ZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXggZGVhYWZiNjE3MzYx
Li4xOTFiYWNmMDIyMDkgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiArKysgYi9NQUlOVEFJ
TkVSUwo+IEBAIC01NzkzLDYgKzU3OTMsNyBAQCBMOiAgICAgICAgZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+ICBTOiAgICAgU3VwcG9ydGVkCj4gIEY6ICAgICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay8KPiAgRjogICAgIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay8KPiArRjogICAgIGRyaXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGst
aGRtaSoKPgo+ICBEUk0gRFJJVkVSUyBGT1IgTlZJRElBIFRFR1JBCj4gIE06ICAgICBUaGllcnJ5
IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgo+IC0tCj4gMi4xNy4xCj4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
