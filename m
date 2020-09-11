Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA30126854E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DA46E1BC;
	Mon, 14 Sep 2020 07:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE33A6E35F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 08:14:03 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 1F7AB9F6B94230E65B93;
 Fri, 11 Sep 2020 16:14:00 +0800 (CST)
Received: from [127.0.0.1] (10.57.60.129) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Fri, 11 Sep 2020
 16:13:53 +0800
Subject: Re: [PATCH] drm/vc4: Remove unused variables
To: Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao
 <tiantao6@hisilicon.com>, <eric@anholt.net>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
References: <1599636807-9003-1-git-send-email-tiantao6@hisilicon.com>
 <83352520-3f8c-96c4-d769-e1c74435d039@suse.de>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <48ea2ef8-cc7d-e54b-58d9-058db3247d2f@huawei.com>
Date: Fri, 11 Sep 2020 16:13:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <83352520-3f8c-96c4-d769-e1c74435d039@suse.de>
X-Originating-IP: [10.57.60.129]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: linuxarm@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzOgoK5ZyoIDIwMjAvOS8xMSAxNTo0NywgVGhvbWFzIFppbW1lcm1hbm4g5YaZ6YGT
Ogo+IEhpCj4gCj4gQW0gMDkuMDkuMjAgdW0gMDk6MzMgc2NocmllYiBUaWFuIFRhbzoKPj4gRml4
ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4+IHZjNF9wbGFu
ZS5jOiBJbiBmdW5jdGlvbiDigJh2YzRfcGxhbmVfaW5pdOKAmToKPj4gdmM0X3BsYW5lLmM6MTM0
MDo2OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhyZXTigJkgc2V0IGJ1dCBub3QKPj4gdXNlZCBbLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPj4KPj4gU2lnbmVkLW9mZi1ieTogVGlhbiBUYW8gPHRp
YW50YW82QGhpc2lsaWNvbi5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0
X3BsYW5lLmMgfCAzICstLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBk
ZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3Bs
YW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9wbGFuZS5jCj4+IGluZGV4IDI0ZDdlNmQu
LjViZTBmNWRkYSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfcGxhbmUu
Ywo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9wbGFuZS5jCj4+IEBAIC0xMzM3LDcg
KzEzMzcsNiBAQCBzdHJ1Y3QgZHJtX3BsYW5lICp2YzRfcGxhbmVfaW5pdChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LAo+PiAgIAlzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSA9IE5VTEw7Cj4+ICAgCXN0
cnVjdCB2YzRfcGxhbmUgKnZjNF9wbGFuZTsKPj4gICAJdTMyIGZvcm1hdHNbQVJSQVlfU0laRSho
dnNfZm9ybWF0cyldOwo+PiAtCWludCByZXQgPSAwOwo+PiAgIAl1bnNpZ25lZCBpOwo+PiAgIAlz
dGF0aWMgY29uc3QgdWludDY0X3QgbW9kaWZpZXJzW10gPSB7Cj4+ICAgCQlEUk1fRk9STUFUX01P
RF9CUk9BRENPTV9WQzRfVF9USUxFRCwKPj4gQEAgLTEzNTcsNyArMTM1Niw3IEBAIHN0cnVjdCBk
cm1fcGxhbmUgKnZjNF9wbGFuZV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4+ICAgCQlm
b3JtYXRzW2ldID0gaHZzX2Zvcm1hdHNbaV0uZHJtOwo+PiAgIAo+PiAgIAlwbGFuZSA9ICZ2YzRf
cGxhbmUtPmJhc2U7Cj4+IC0JcmV0ID0gZHJtX3VuaXZlcnNhbF9wbGFuZV9pbml0KGRldiwgcGxh
bmUsIDAsCj4+ICsJZHJtX3VuaXZlcnNhbF9wbGFuZV9pbml0KGRldiwgcGxhbmUsIDAsCj4+ICAg
CQkJCSAgICAgICAmdmM0X3BsYW5lX2Z1bmNzLAo+PiAgIAkJCQkgICAgICAgZm9ybWF0cywgQVJS
QVlfU0laRShmb3JtYXRzKSwKPj4gICAJCQkJICAgICAgIG1vZGlmaWVycywgdHlwZSwgTlVMTCk7
Cj4gCj4gSU1ITyB2YzRfcGxhbmVfaW5pdCgpIHNob3VsZCByYXRoZXIgaGFuZGxlIHJldCBjb3Jy
ZWN0bHkgYW5kIHJldHVybiBhbgo+IGVycm9yIGlmIGl0J3Mgbm9uLXplcm8uClRoYW5rcyBmb3Ig
dGhlIGFkdmljZSwgSSdtIGRyb3BwaW5nIHRoZSBwYXRjaCBhbmQgcmUtcG9zdGluZyBhbm9oZXIg
CnBhdGNoIHRvIGZpeCB0aGlzIHdhcm5pbmcuCj4gCj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCj4g
Cj4+Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
