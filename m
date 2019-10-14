Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1A5D6FED
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 09:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28C56E607;
	Tue, 15 Oct 2019 07:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2B46E124
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 07:52:49 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 0A0DBB54B087618AAE14;
 Mon, 14 Oct 2019 15:52:47 +0800 (CST)
Received: from [127.0.0.1] (10.74.221.148) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Mon, 14 Oct 2019
 15:52:45 +0800
Subject: Re: [PATCH -next] drm/dp-mst: Fix unused variable warning
To: <dri-devel@lists.freedesktop.org>
References: <1571038880-22019-1-git-send-email-zhangshaokun@hisilicon.com>
From: Shaokun Zhang <zhangshaokun@hisilicon.com>
Message-ID: <0869dfea-f632-e55b-f293-894536b54912@hisilicon.com>
Date: Mon, 14 Oct 2019 15:52:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1571038880-22019-1-git-send-email-zhangshaokun@hisilicon.com>
X-Originating-IP: [10.74.221.148]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 15 Oct 2019 07:12:31 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGxlYXNlIGlnbm9yZSB0aGlzIG1haWwuIEkgd2lsbCByZXNlbmQgaXQgYWdhaW4uCgpUaGFua3MK
Ck9uIDIwMTkvMTAvMTQgMTU6NDEsIFNoYW9rdW4gWmhhbmcgd3JvdGU6Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jCj4gaW5kZXggOTM2NGU0ZjQyOTc1Li45Y2NjYzVlNjMzMDkg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBAQCAtNDE4NCw4ICs0
MTg0LDYgQEAgRVhQT1JUX1NZTUJPTChkcm1fZHBfbXN0X3RvcG9sb2d5X3N0YXRlX2Z1bmNzKTsK
PiAgc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfc3RhdGUgKmRybV9hdG9taWNfZ2V0X21zdF90
b3BvbG9neV9zdGF0ZShzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsCj4gIAkJCQkJCQkJ
ICAgIHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyKQo+ICB7Cj4gLQlzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2ID0gbWdyLT5kZXY7Cj4gLQo+ICAJcmV0dXJuIHRvX2RwX21zdF90b3Bv
bG9neV9zdGF0ZShkcm1fYXRvbWljX2dldF9wcml2YXRlX29ial9zdGF0ZShzdGF0ZSwgJm1nci0+
YmFzZSkpOwo+ICB9Cj4gIEVYUE9SVF9TWU1CT0woZHJtX2F0b21pY19nZXRfbXN0X3RvcG9sb2d5
X3N0YXRlKTsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
