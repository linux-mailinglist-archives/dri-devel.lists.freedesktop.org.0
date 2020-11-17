Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E00B2B664E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 15:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6825B6E217;
	Tue, 17 Nov 2020 14:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618DF6E217
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 14:05:44 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C935C20729
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605621944;
 bh=MUSMd6abJAdtwLkhDfU5Mker4vAbz8CcGo3fa144da0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VSYKIA3tpTAqnwTVirfgwxldCpS6alOHqC3N3h606v/9KSio/gNQHpAofIdAaa7u3
 aUSpRPeNaOqDT0ncZoDaDsDhvyRavghafJ8d1/E51O3fbS8QfLy48EkFol1TSTiw6p
 asMeyHLAqNStBSTPB+b8t+111C0ZebFK2IA3TEhI=
Received: by mail-wm1-f45.google.com with SMTP id c9so3357896wml.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 06:05:43 -0800 (PST)
X-Gm-Message-State: AOAM531v4qeDmue49/+gV5xRVfhVLHAzwkC4WEM0EkYUwcGyB3N14Z5Y
 RKij8LJBXi8UwDvLQNkhvDFQtvqVazJRuidX/Q==
X-Google-Smtp-Source: ABdhPJygZ6W6WYu5uc7uhlYwgaHToMSoM6KFGBB0TcyPL934xUgi43XW1SDxnf6FiZEK2/cNMP1hOTWV5/GNpNfg+/Q=
X-Received: by 2002:a1c:4c09:: with SMTP id z9mr4572652wmf.55.1605621942348;
 Tue, 17 Nov 2020 06:05:42 -0800 (PST)
MIME-Version: 1.0
References: <20201116231407.94-1-chunkuang.hu@kernel.org>
 <20201116231407.94-4-chunkuang.hu@kernel.org>
In-Reply-To: <20201116231407.94-4-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 17 Nov 2020 22:05:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-0eFBVnJ3-Fcv-t9AHJMWFhvgM28cP1ksw5DZ8OKs_gg@mail.gmail.com>
Message-ID: <CAAOTY_-0eFBVnJ3-Fcv-t9AHJMWFhvgM28cP1ksw5DZ8OKs_gg@mail.gmail.com>
Subject: Re: [RESEND PATCH 3/3] MAINTAINERS: add files for Mediatek DRM drivers
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

SGksIFZpbm9kOgoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAy
MDIw5bm0MTHmnIgxN+aXpSDpgLHkuowg5LiK5Y2INzoxNOWvq+mBk++8mgo+Cj4gTWVkaWF0ZWsg
TUlQSSBEU0kgcGh5IGRyaXZlciBpcyBtb3ZlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ayB0bwo+IGRyaXZlcnMvcGh5L21lZGlhdGVrLCBzbyBhZGQgdGhlIG5ldyBmb2xkZXIgdG8gdGhl
IE1lZGlhdGVrIERSTSBkcml2ZXJzJwo+IGluZm9ybWF0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTog
Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+CgpJZiB5b3UgYXBwbHkgdGhp
cyBwYXRjaCwgcGxlYXNlIGFkZCBhY2tlZC1ieSB0YWcgb2YgY2h1bmZlbmcgWzFdLCB0aGFua3Mu
CgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVr
L3BhdGNoLzIwMjAxMDI5MTUyNzAyLjUzMy00LWNodW5rdWFuZy5odUBrZXJuZWwub3JnLwoKUmVn
YXJkcywKQ2h1bi1LdWFuZy4KCj4gLS0tCj4gIE1BSU5UQUlORVJTIHwgMSArCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJ
TlRBSU5FUlMKPiBpbmRleCBlNzM2MzZiNzVmMjkuLjE0ZjUwMThjMDFiNiAxMDA2NDQKPiAtLS0g
YS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAgLTU4NjcsNiArNTg2Nyw3IEBA
IFM6ICAgICAgICBTdXBwb3J0ZWQKPiAgRjogICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrLwo+ICBGOiAgICAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrLwo+ICBGOiAgICAgZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1oZG1pKgo+ICtGOiAg
ICAgZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1taXBpKgo+Cj4gIERSTSBEUklWRVJTIEZP
UiBOVklESUEgVEVHUkEKPiAgTTogICAgIFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0Bn
bWFpbC5jb20+Cj4gLS0KPiAyLjE3LjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
