Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0852104634
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 22:55:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EAF6EA44;
	Wed, 20 Nov 2019 21:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1160 seconds by postgrey-1.36 at gabe;
 Wed, 20 Nov 2019 21:55:04 UTC
Received: from manjaro.org (mail.manjaro.org [176.9.38.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB52E6EA44
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 21:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by manjaro.org (Postfix) with ESMTP id 80DBC36CEEA7;
 Wed, 20 Nov 2019 22:35:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from manjaro.org ([127.0.0.1])
 by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X2oyrMKWTOPv; Wed, 20 Nov 2019 22:35:40 +0100 (CET)
From: Tobias Schramm <t.schramm@manjaro.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/1] drm/panel: simple: Add support for BOE NV140FHM-N49 panel
 to panel-simple
Date: Wed, 20 Nov 2019 22:34:39 +0100
Message-Id: <20191120213440.924563-1-t.schramm@manjaro.org>
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, Tobias Schramm <t.schramm@manjaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIHRoZSAxNCBpbmNoIEJPRSBOVjE0MEZITS1ONDkg
ZURQIHBhbmVsIHRvCnRoZSBwYW5lbC1zaW1wbGUgZHJpdmVyLiBUaGlzIHBhbmVsIGlzIHVzZWQg
YnkgdGhlIFBpbmVib29rIFByby4KClRvYmlhcyBTY2hyYW1tICgxKToKICBkcm0vcGFuZWw6IHNp
bXBsZTogQWRkIHN1cHBvcnQgZm9yIEJPRSBOVjE0MEZITS1ONDkgcGFuZWwgdG8KICAgIHBhbmVs
LXNpbXBsZQoKIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8IDM1ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCsp
CgotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
