Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 736A120027
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 09:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B48889319;
	Thu, 16 May 2019 07:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5898921A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 16:04:48 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 453zsB4SbJz1rFrb;
 Wed, 15 May 2019 18:04:46 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 453zsB3QvGz1qqkL;
 Wed, 15 May 2019 18:04:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 5kj7UBK9TA2A; Wed, 15 May 2019 18:04:44 +0200 (CEST)
X-Auth-Info: yb3aXatXonqrkdakbIW4956qityxBqYXZDTyuzRUq58=
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl
 [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 15 May 2019 18:04:44 +0200 (CEST)
From: Lukasz Majewski <lukma@denx.de>
To: Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 1/2] dt-bindings: display/panel: Add KOE tx14d24vm1bpa
 display description
Date: Wed, 15 May 2019 18:04:28 +0200
Message-Id: <20190515160428.6114-1-lukma@denx.de>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180412143715.6828-1-lukma@denx.de>
References: <20180412143715.6828-1-lukma@denx.de>
X-Mailman-Approved-At: Thu, 16 May 2019 07:22:48 +0000
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
Cc: devicetree@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lukasz Majewski <lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBjb21taXQgYWRkcyBkb2N1bWVudGF0aW9uIGVudHJ5IGRlc2NyaXB0aW9uIGZvciBLT0Un
cyA1LjciIGRpc3BsYXkuCgpTaWduZWQtb2ZmLWJ5OiBMdWthc3ogTWFqZXdza2kgPGx1a21hQGRl
bnguZGU+CgotLS0KUHJldmlvdXMgZGlzY3Vzc2lvbiAoYW5kIFJvYidzIFJldmlld2VkLWJ5KSBh
Ym91dCB0aGlzIHBhdGNoCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTAzMzk1
OTUvCgpDaGFuZ2VzIGZvciB2NDoKLSBSZWJhc2Ugb24gdG9wIG9mIG5ld2VzdCBtYWlubGluZQpT
SEExOiA1YWM5NDMzMjI0OGVlMDE3OTY0YmEzNjhjZGRhNGNlNjQ3ZTNhYmE3CgpDaGFuZ2VzIGZv
ciB2MyA6Ci0gTmV3IHBhdGNoCi0tLQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwva29lLHR4
MTRkMjR2bTFicGEudHh0ICAgfCA0MiArKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgNDIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2tvZSx0eDE0ZDI0dm0xYnBhLnR4dAoK
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL2tvZSx0eDE0ZDI0dm0xYnBhLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL2tvZSx0eDE0ZDI0dm0xYnBhLnR4dApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmJlN2FjNjY2ODA3YgotLS0gL2Rldi9udWxsCisrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2tvZSx0eDE0
ZDI0dm0xYnBhLnR4dApAQCAtMCwwICsxLDQyIEBACitLYW9oc2l1bmcgT3B0by1FbGVjdHJvbmlj
cyBJbmMuIDUuNyIgUVZHQSAoMzIwIHggMjQwKSBURlQgTENEIHBhbmVsCisKK1JlcXVpcmVkIHBy
b3BlcnRpZXM6CistIGNvbXBhdGlibGU6IHNob3VsZCBiZSAia29lLHR4MTRkMjR2bTFicGEiCist
IGJhY2tsaWdodDogcGhhbmRsZSBvZiB0aGUgYmFja2xpZ2h0IGRldmljZSBhdHRhY2hlZCB0byB0
aGUgcGFuZWwKKy0gcG93ZXItc3VwcGx5OiBzaW5nbGUgcmVndWxhdG9yIHRvIHByb3ZpZGUgdGhl
IHN1cHBseSB2b2x0YWdlCisKK1JlcXVpcmVkIG5vZGVzOgorLSBwb3J0OiBQYXJhbGxlbCBwb3J0
IG1hcHBpbmcgdG8gY29ubmVjdCB0aGlzIGRpc3BsYXkKKworVGhpcyBwYW5lbCBuZWVkcyBzaW5n
bGUgcG93ZXIgc3VwcGx5IHZvbHRhZ2UuIEl0cyBiYWNrbGlnaHQgaXMgY29ubnRyb2xsZWQKK3Zp
YSBQV00gc2lnbmFsLgorCitFeGFtcGxlOgorLS0tLS0tLS0KKworRXhhbXBsZSBkZXZpY2UtdHJl
ZSBkZWZpbml0aW9uIHdoZW4gY29ubmVjdGVkIHRvIGlNWDUzIGJhc2VkIGJvYXJkCisKKwlsY2Rf
cGFuZWw6IGxjZC1wYW5lbCB7CisJCWNvbXBhdGlibGUgPSAia29lLHR4MTRkMjR2bTFicGEiOwor
CQliYWNrbGlnaHQgPSA8JmJhY2tsaWdodF9sY2Q+OworCQlwb3dlci1zdXBwbHkgPSA8JnJlZ18z
djM+OworCisJCXBvcnQgeworCQkJbGNkX3BhbmVsX2luOiBlbmRwb2ludCB7CisJCQkJcmVtb3Rl
LWVuZHBvaW50ID0gPCZsY2RfZGlzcGxheV9vdXQ+OworCQkJfTsKKwkJfTsKKwl9OworCitUaGVu
IG9uZSBuZWVkcyB0byBleHRlbmQgdGhlIGRpc3BYIG5vZGU6CisKKwlsY2RfZGlzcGxheTogZGlz
cDEgeworCisJCXBvcnRAMSB7CisJCQlyZWcgPSA8MT47CisKKwkJCWxjZF9kaXNwbGF5X291dDog
ZW5kcG9pbnQgeworCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbGNkX3BhbmVsX2luPjsKKwkJCX07
CisJCX07CisJfTsKLS0gCjIuMTEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
