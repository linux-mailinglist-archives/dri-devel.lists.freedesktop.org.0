Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE62257E21
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 18:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE78A6E2E5;
	Mon, 31 Aug 2020 16:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190536E05C
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 16:02:50 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF6D920FC3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 16:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598889770;
 bh=iE2JfXtNRXcBePxejNj2vUktxPmSGqItV3WCiVQWgHE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aG0DDdc9WaflHUKr1gprlR4aRG0QzH6Q6MUeJfGvbWfxmHwwKuo2S5hQ5lOU5zwSr
 P8el1/7aCTUfpMUAoqct3NYExCyvx69iQwp0jNGmv6za6vsPngXGkRmEcgr1vBEY25
 Dk1pPChAxZINkzT6av+40EEyJ2Exv+pCnZp0AkTk=
Received: by mail-ej1-f50.google.com with SMTP id bo3so9195942ejb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 09:02:49 -0700 (PDT)
X-Gm-Message-State: AOAM5335kKUVe0yqiC4UHhXxtAnn1Lq2Mc8MVKh+AamtMQZADYxu2fms
 B+f6TlMaNjaSbUB8O9/ByVTGqmC8yUJd8fJmVw==
X-Google-Smtp-Source: ABdhPJzVfg2VBCCh3cFVWTXiqVCWpKgkXDpTn86toFw+LFgxINOPaV80H9SEI6gSfpVAinA9c18C4USSDNd1DJAwL8w=
X-Received: by 2002:a17:906:1909:: with SMTP id
 a9mr1679553eje.127.1598889768317; 
 Mon, 31 Aug 2020 09:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200823014830.15962-1-chunkuang.hu@kernel.org>
 <20200823014830.15962-5-chunkuang.hu@kernel.org>
 <1598838539.7054.9.camel@mhfsdcap03>
In-Reply-To: <1598838539.7054.9.camel@mhfsdcap03>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 1 Sep 2020 00:02:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9hZgLGSiqCA6a1Ea+TjGZAH4-t4DFS9jCz3nEXNJY1zg@mail.gmail.com>
Message-ID: <CAAOTY_9hZgLGSiqCA6a1Ea+TjGZAH4-t4DFS9jCz3nEXNJY1zg@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] MAINTAINERS: add files for Mediatek DRM drivers
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIENodW5mZW5nOgoKQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiDm
lrwgMjAyMOW5tDjmnIgzMeaXpSDpgLHkuIAg5LiK5Y2IOTo1MOWvq+mBk++8mgo+Cj4gT24gU3Vu
LCAyMDIwLTA4LTIzIGF0IDA5OjQ4ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+ID4gTWVk
aWF0ZWsgSERNSSBwaHkgZHJpdmVyIGlzIG1vdmVkIGZyb20gZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrIHRvCj4gPiBkcml2ZXJzL3BoeS9tZWRpYXRlaywgc28gYWRkIHRoZSBuZXcgZm9sZGVyIHRv
IHRoZSBNZWRpYXRlayBEUk0gZHJpdmVycycKPiA+IGluZm9ybWF0aW9uLgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+ID4gUmV2
aWV3ZWQtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+Cj4gPiAt
LS0KPiA+ICBNQUlOVEFJTkVSUyB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gPiBp
bmRleCBkZWFhZmI2MTczNjEuLjE5MWJhY2YwMjIwOSAxMDA2NDQKPiA+IC0tLSBhL01BSU5UQUlO
RVJTCj4gPiArKysgYi9NQUlOVEFJTkVSUwo+ID4gQEAgLTU3OTMsNiArNTc5Myw3IEBAIEw6ICAg
ICAgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gIFM6ICAgU3VwcG9ydGVkCj4g
PiAgRjogICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay8KPiA+ICBGOiAgIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay8KPiA+ICtGOiAgIGRyaXZlcnMv
cGh5L21lZGlhdGVrL3BoeS1tdGstaGRtaSoKPiA+Cj4gPiAgRFJNIERSSVZFUlMgRk9SIE5WSURJ
QSBURUdSQQo+ID4gIE06ICAgVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNv
bT4KPgo+IFJldmlld2VkLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5j
b20+Cj4KCkNvdWxkIHlvdSBnaXZlIGFuICdBY2tlZC1ieScgdGFnIG9uIHRoaXMgcGF0Y2g/IFNv
IEkgY291bGQgYXBwbHkgdGhlCndob2xlIHNlcmllcyBpbnRvIG15IHRyZWUuCgpSZWdhcmRzLApD
aHVuLUt1YW5nLgoKPiBUaGFua3MKPgo+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
