Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093161D0ED
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 22:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5273A892D2;
	Tue, 14 May 2019 20:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB87892D2;
 Tue, 14 May 2019 20:57:05 +0000 (UTC)
Received: from cpc129250-craw9-2-0-cust139.know.cable.virginm.net
 ([82.43.126.140] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hQeTu-0002fC-Bd; Tue, 14 May 2019 20:57:02 +0000
From: Colin King <colin.king@canonical.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau/bios/init: fix spelling mistake "CONDITON" ->
 "CONDITION"
Date: Tue, 14 May 2019 21:57:01 +0100
Message-Id: <20190514205701.5750-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZXJlIGlz
IGEgc3BlbGxpbmcgbWlzdGFrZSBpbiBhIHdhcm5pbmcgbWVzc2FnZS4gRml4IGl0LgoKU2lnbmVk
LW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9iaW9zL2luaXQuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Jpb3MvaW5pdC5jIGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvYmlvcy9pbml0LmMKaW5kZXggZWMwZTlmNzIy
NGI1Li4zZjRmMjdkMTkxYWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252
a20vc3ViZGV2L2Jpb3MvaW5pdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20v
c3ViZGV2L2Jpb3MvaW5pdC5jCkBAIC04MzQsNyArODM0LDcgQEAgaW5pdF9nZW5lcmljX2NvbmRp
dGlvbihzdHJ1Y3QgbnZiaW9zX2luaXQgKmluaXQpCiAJCWluaXRfZXhlY19zZXQoaW5pdCwgZmFs
c2UpOwogCQlicmVhazsKIAlkZWZhdWx0OgotCQl3YXJuKCJJTklUX0dFTkVSSUNfQ09ORElUT046
IHVua25vd24gMHglMDJ4XG4iLCBjb25kKTsKKwkJd2FybigiSU5JVF9HRU5FUklDX0NPTkRJVElP
TjogdW5rbm93biAweCUwMnhcbiIsIGNvbmQpOwogCQlpbml0LT5vZmZzZXQgKz0gc2l6ZTsKIAkJ
YnJlYWs7CiAJfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
