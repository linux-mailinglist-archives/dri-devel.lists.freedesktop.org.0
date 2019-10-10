Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD38DD3999
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 08:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D07E6EBB1;
	Fri, 11 Oct 2019 06:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123F06EA99;
 Thu, 10 Oct 2019 06:48:07 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 68E07F745D4B8C299010;
 Thu, 10 Oct 2019 14:48:02 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Thu, 10 Oct 2019
 14:47:55 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <robdclark@chromium.org>, <sean@poorly.run>, <airlied@linux.ie>,
 <bjorn.andersson@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: [PATCH 0/4] drm/msm: Remove four set but not used variables
Date: Thu, 10 Oct 2019 14:55:02 +0800
Message-ID: <1570690506-83287-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 11 Oct 2019 06:48:21 +0000
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

emhlbmdiaW4gKDQpOgogIGRybS9tc20vbWRwNTogUmVtb3ZlIHNldCBidXQgbm90IHVzZWQgdmFy
aWFibGUgJ2ZtdCcKICBkcm0vbXNtL21kcDU6IFJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlh
YmxlICdod19jZmcnIGluIGJsZW5kX3NldHVwCiAgZHJtL21zbS9kc2k6IFJlbW92ZSBzZXQgYnV0
IG5vdCB1c2VkIHZhcmlhYmxlICdscHgnCiAgZHJtL21zbS9kc2k6IFJlbW92ZSBzZXQgYnV0IG5v
dCB1c2VkIHZhcmlhYmxlICdscCcKCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1
X2NydGMuYyB8IDMgLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X3NtcC5j
ICB8IDIgLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMgICAgICAgIHwgMyAr
LS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmMgICAgIHwgNiArKy0tLS0K
IDQgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCi0tCjIu
Ny40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
