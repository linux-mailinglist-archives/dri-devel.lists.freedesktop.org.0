Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C4D56AB5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 15:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0516E436;
	Wed, 26 Jun 2019 13:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A886E436
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 13:36:17 +0000 (UTC)
Received: from 177.205.71.220.dynamic.adsl.gvt.net.br ([177.205.71.220]
 helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hg85u-0004t1-0v; Wed, 26 Jun 2019 13:36:14 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hg85s-0003Ss-0I; Wed, 26 Jun 2019 10:36:12 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH] docs: gpu: add msm-crash-dump.rst to the index.rst file
Date: Wed, 26 Jun 2019 10:36:11 -0300
Message-Id: <e22a340cf94240094cfb38f8c62f6916ea99394a.1561556169.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vjIOKCboXHW6Mjixp79Kk6C1xDXu7gjmz0O9Axsf0MM=; b=PCLh0txTepWivhui/lf1a6LRk
 MlxUkWxltrq9e7vJoBgvuGfdGXgFAF9ignUrfYEus8Xw4F+HunNQ5VqYGauPI6K29f5lV/EmRsA3k
 ColDokfjeEWY2auwVjpTjA/OaIn9OtiSKHeR4SQP+o3EDy2LFjTFooznQcN8A6ZFO+8RSE6xTXZ08
 XvUG+3cu8sBe6e6Fujv+svM7KbZtXVVGXFvphYvBJA/rj+kHkJFsiwlwHTs3XzUFd0Co5ola8Tcny
 h/Ijce5kZ1THb96rBj2dslJIa+spsaN3WVgXnGTfj1XxF6G4VmNcs62MEYOBCb7fWQ8T+P5VXQk+8
 G7GxOP0EA==;
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
dGlvbi9ncHUvaW5kZXgucnN0IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dwdS9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9u
L2dwdS9pbmRleC5yc3QKaW5kZXggMWZjZjhlODUxZTE1Li41NWYzZjQyOTQ2ODYgMTAwNjQ0Ci0t
LSBhL0RvY3VtZW50YXRpb24vZ3B1L2luZGV4LnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2dwdS9p
bmRleC5yc3QKQEAgLTEyLDYgKzEyLDcgQEAgTGludXggR1BVIERyaXZlciBEZXZlbG9wZXIncyBH
dWlkZQogICAgZHJtLXVhcGkKICAgIGRybS1jbGllbnQKICAgIGRyaXZlcnMKKyAgIG1zbS1jcmFz
aC1kdW1wCiAgICB2Z2Etc3dpdGNoZXJvbwogICAgdmdhYXJiaXRlcgogICAgdG9kbwotLSAKMi4y
MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
