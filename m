Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1875A263E85
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 09:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2536E217;
	Thu, 10 Sep 2020 07:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7586E0FD
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 13:42:15 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id EE0738C8ED968C64CCB5;
 Wed,  9 Sep 2020 21:42:08 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Wed, 9 Sep 2020
 21:42:00 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <thierry.reding@gmail.com>, <sam@ravnborg.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <linus.walleij@linaro.org>, <paul@crapouillou.net>
Subject: [PATCH -next] drm/panel: s6e63m0: Add missing MODULE_LICENSE
Date: Wed, 9 Sep 2020 21:41:37 +0800
Message-ID: <20200909134137.32284-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 10 Sep 2020 07:22:25 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

S2J1aWxkIHdhcm5zIHdoZW4gdGhpcyBmaWxlIGlzIGJ1aWx0IGFzIGEgbG9hZGFibGUgbW9kdWxl
OgoKV0FSTklORzogbW9kcG9zdDogbWlzc2luZyBNT0RVTEVfTElDRU5TRSgpIGluIGRyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTYzbTAubwoKQWRkIHRoZSBtaXNzaW5nIGxp
Y2Vuc2UvYXV0aG9yL2Rlc2NyaXB0aW9uIHRhZ3MuCgpGaXhlczogYjdiMjNlNDQ3Njg3ICgiZHJt
L3BhbmVsOiBzNmU2M20wOiBCcmVhayBvdXQgU1BJIHRyYW5zcG9ydCIpClNpZ25lZC1vZmYtYnk6
IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtc2Ftc3VuZy1zNmU2M20wLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
c2Ftc3VuZy1zNmU2M20wLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Ftc3VuZy1z
NmU2M20wLmMKaW5kZXggMDQ0Mjk0YWFmZTI3Li4zZWVlNjdlMmQ4NmEgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTYzbTAuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Ftc3VuZy1zNmU2M20wLmMKQEAgLTUzNCwzICs1MzQsNyBA
QCBpbnQgczZlNjNtMF9yZW1vdmUoc3RydWN0IGRldmljZSAqZGV2KQogCXJldHVybiAwOwogfQog
RVhQT1JUX1NZTUJPTF9HUEwoczZlNjNtMF9yZW1vdmUpOworCitNT0RVTEVfQVVUSE9SKCJQYXdl
xYIgQ2htaWVsIDxwYXdlbC5taWtvbGFqLmNobWllbEBnbWFpbC5jb20+Iik7CitNT0RVTEVfREVT
Q1JJUFRJT04oInM2ZTYzbTAgTENEIERyaXZlciIpOworTU9EVUxFX0xJQ0VOU0UoIkdQTCB2MiIp
OwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
