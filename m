Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB50856E5F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 18:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E8F6E48E;
	Wed, 26 Jun 2019 16:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBCD6E48E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 16:09:51 +0000 (UTC)
Received: from [186.213.242.156] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hgAUU-0002Um-Vg; Wed, 26 Jun 2019 16:09:46 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hgAUR-00083F-FM; Wed, 26 Jun 2019 13:09:43 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v2] docs: gpu: add msm-crash-dump.rst to the index.rst file
Date: Wed, 26 Jun 2019 13:09:42 -0300
Message-Id: <f6cc8cf99067d44b0a43c2b7cfbee273e8cc974b.1561565379.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gCTAps/lYoSk9lPt+qf517YJddtp5CleOCu5z7O8PhY=; b=Nf/H1sdFoSNlSGwY2S6sd4HVQ
 nmeKZ3Z/tecPr3cXWRdyRA8+fl0gJKFC33IUlNN1M0Udy2sZann0YYMW4Piy+St/Tx1zLsS58sc6M
 F7L78si7kGv5NeOBGl0cV4Jah94hDY/MlnfgI6s42ZnuAVu3UhmYWpEwepAP3NKlF2noMIlDD/Lu6
 9g21Ncqgi6b+fSmQOacDqSEYJ7z0DANeQ44bl6essqwqCrrlRfEWdk39koNTa5K/Wu7AQA1AsYtpv
 wDupzG57mzknnSHdqVVa1WC0E72OtZMYIUZ4PGhH+/3QNdPdTfn6pcqtKiy83iSwUWTJ53p5hdLGC
 Hsl9WcoQQ==;
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmaWxlIGlzIGN1cnJlbnRseSBvcnBoYW5lZC4KClNpZ25lZC1vZmYtYnk6IE1hdXJvIENh
cnZhbGhvIENoZWhhYiA8bWNoZWhhYitzYW1zdW5nQGtlcm5lbC5vcmc+Ci0tLQogRG9jdW1lbnRh
dGlvbi9ncHUvZHJpdmVycy5yc3QgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1L2RyaXZlcnMucnN0IGIvRG9jdW1lbnRh
dGlvbi9ncHUvZHJpdmVycy5yc3QKaW5kZXggNGJmYjcwNjhlOWY3Li42Yzg4YzU3YjkwY2YgMTAw
NjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L2RyaXZlcnMucnN0CisrKyBiL0RvY3VtZW50YXRp
b24vZ3B1L2RyaXZlcnMucnN0CkBAIC0yMCw2ICsyMCw3IEBAIEdQVSBEcml2ZXIgRG9jdW1lbnRh
dGlvbgogICAgeGVuLWZyb250CiAgICBhZmJjCiAgICBrb21lZGEta21zCisgICBtc20tY3Jhc2gt
ZHVtcAogCiAuLiBvbmx5OjogIHN1YnByb2plY3QgYW5kIGh0bWwKIAotLSAKMi4yMS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
