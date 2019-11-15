Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1792FF926
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2F26E379;
	Sun, 17 Nov 2019 11:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D43D6E604
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 14:19:53 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 19622FF48B9889C9C19A;
 Fri, 15 Nov 2019 22:19:51 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Fri, 15 Nov 2019
 22:19:43 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <patrik.r.jakobsson@gmail.com>, <daniel.vetter@ffwll.ch>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/3] drm/gma500: remove some set but not used variables
Date: Fri, 15 Nov 2019 22:27:04 +0800
Message-ID: <1573828027-122323-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 17 Nov 2019 11:44:18 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

emhlbmdiaW4gKDMpOgogIGRybS9nbWE1MDA6IHJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlh
YmxlICdodG90YWwnCiAgZHJtL2dtYTUwMDogcmVtb3ZlIHNldCBidXQgbm90IHVzZWQgdmFyaWFi
bGUgJ2Vycm9yJwogIGRybS9nbWE1MDA6IHJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlhYmxl
ICdpc19oZG1pJywnaXNfY3J0JwoKIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvY2R2X2ludGVsX2Rp
c3BsYXkuYyB8IDcgKystLS0tLQogZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9oZG1p
LmMgICAgIHwgNCArLS0tCiBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9pcnEuYyAgICAgICAg
ICAgfCAyIC0tCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25z
KC0pCgotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
