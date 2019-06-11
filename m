Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AD63D369
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 19:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0F3890DA;
	Tue, 11 Jun 2019 17:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6444B890DA
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 17:05:44 +0000 (UTC)
Received: from 177.41.119.178.dynamic.adsl.gvt.net.br ([177.41.119.178]
 helo=coco.lan)
 by casper.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hakCs-0002PQ-Bo; Tue, 11 Jun 2019 17:05:10 +0000
Date: Tue, 11 Jun 2019 14:05:01 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 06/20] docs: mark orphan documents as such
Message-ID: <20190611140501.11ba091b@coco.lan>
In-Reply-To: <CAHp75VfTNJOGZx-PoUXLRvzghqf6bVUdJ+yFjE9hNtDLCQ1=UA@mail.gmail.com>
References: <ff457774d46d96e8fe56b45409aba39d87a8672a.1559933665.git.mchehab+samsung@kernel.org>
 <0bea1c7c4fc06c7edabbf3185c0cbbc6e85eafd0.1559933665.git.mchehab+samsung@kernel.org>
 <CAHp75VfTNJOGZx-PoUXLRvzghqf6bVUdJ+yFjE9hNtDLCQ1=UA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Yq617plFowJ6SPqfSlFnXKBCkZMDSV9shNeKC4mMEY=; b=K0CsPURbcVID3VZgvAW0iTm3wR
 a4w5JgdjFouiUq0BWdslkyoBdxaVdGLJePyibi1Mog+r1AuYwR/+jqWtSVGIrgf6yzUg0z1U28CyG
 ZhJdIclAT572+X/UXggsJ8f8SVJMT/MisC//pgJXvXzFsvm9J+X3u1iSiUKWNx87KYuHGB3heK7cb
 r1U6atgMP9cSs7F68WdhTtVFB7a/r7PPkSHtsAXTs+U5GV1KWlGhJYzDFXrGHhlV1xt/wYfmrvWud
 Gs8cNb0zXmzCs1nXi+2dGANfmt3c8nyUKVKzyntwvyexURPTWIVP8gQmd/HhZ+q8RGBPy2CreqY6B
 yzJmGK5g==;
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
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Linux PM <linux-pm@vger.kernel.org>,
 Matan Ziv-Av <matan@svgalib.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, Sean Paul <sean@poorly.run>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, "open list:LINUX
 FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW0gVHVlLCAxMSBKdW4gMjAxOSAxOTo1MjowNCArMDMwMApBbmR5IFNoZXZjaGVua28gPGFuZHku
c2hldmNoZW5rb0BnbWFpbC5jb20+IGVzY3JldmV1OgoKPiBPbiBGcmksIEp1biA3LCAyMDE5IGF0
IDEwOjA0IFBNIE1hdXJvIENhcnZhbGhvIENoZWhhYgo+IDxtY2hlaGFiK3NhbXN1bmdAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gPiBTcGhpbnggZG9lc24ndCBsaWtlIG9ycGhhbiBkb2N1bWVudHM6ICAK
PiAKPiA+ICAgICBEb2N1bWVudGF0aW9uL2xhcHRvcHMvbGctbGFwdG9wLnJzdDogV0FSTklORzog
ZG9jdW1lbnQgaXNuJ3QgaW5jbHVkZWQgaW4gYW55IHRvY3RyZWUgIAo+IAo+ID4gIERvY3VtZW50
YXRpb24vbGFwdG9wcy9sZy1sYXB0b3AucnN0ICAgICAgICAgICAgIHwgMiArKyAgCj4gCj4gPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9sYXB0b3BzL2xnLWxhcHRvcC5yc3QgYi9Eb2N1bWVu
dGF0aW9uL2xhcHRvcHMvbGctbGFwdG9wLnJzdAo+ID4gaW5kZXggYWE1MDNlZTliM2JjLi5mMmMy
ZmZlMzExMDEgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2xhcHRvcHMvbGctbGFwdG9w
LnJzdAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9sYXB0b3BzL2xnLWxhcHRvcC5yc3QKPiA+IEBA
IC0xLDUgKzEsNyBAQAo+ID4gIC4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKwo+
ID4KPiA+ICs6b3JwaGFuOgo+ID4gKwo+ID4gIExHIEdyYW0gbGFwdG9wIGV4dHJhIGZlYXR1cmVz
Cj4gPiAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+ICAKPiAKPiBDYW4gd2UgcmF0
aGVyIGNyZWF0ZSBhIHRvYyB0cmVlIHRoZXJlPwo+IEl0IHdhcyBhIGZpcnN0IGRvY3VtZW50IGlu
IHJlU1QgZm9ybWF0IGluIHRoYXQgZm9sZGVyLgoKU3VyZSwgYnV0OgoKMSkgSSBoYXZlIGEgcGF0
Y2ggY29udmVydGluZyB0aGUgb3RoZXIgZmlsZXMgb24gdGhpcyBkaXIgdG8gcnN0OgoKCWh0dHBz
Oi8vZ2l0LmxpbnV4dHYub3JnL21jaGVoYWIvZXhwZXJpbWVudGFsLmdpdC9jb21taXQvP2g9Y29u
dmVydF9yc3RfcmVuYW1lc192NC4xJmlkPWFiYzEzMjMzMDM1ZmRmZGJjNWVmMmYyZmJkM2QxMjdh
MWFiMTU1MzAKCjIpIEl0IHByb2JhYmx5IG1ha2VzIHNlbnNlIHRvIG1vdmUgdGhlIGVudGlyZSBk
aXIgdG8KRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS4KClNvLCBJIHdvdWxkIHByZWZlciB0byBo
YXZlIHRoZSA6b3JwaGFuOiBoZXJlIHdoaWxlICgxKSBpcyBub3QgbWVyZ2VkLgoKVGhhbmtzLApN
YXVybwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
