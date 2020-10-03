Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B192830CB
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 09:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F07F6E0E3;
	Mon,  5 Oct 2020 07:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902AA6E154
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Oct 2020 22:48:11 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4C3hpd1q7Wz1qs3p;
 Sun,  4 Oct 2020 00:48:09 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4C3hpd1cJwz1qy6R;
 Sun,  4 Oct 2020 00:48:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id P_HrMBj48kFu; Sun,  4 Oct 2020 00:48:08 +0200 (CEST)
X-Auth-Info: 86Cmeceeiz+TeBZMiVONf7wr9FwZpF1nirw4TOwIaTY=
Received: from desktop.lan (ip-89-176-112-137.net.upcbroadband.cz
 [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun,  4 Oct 2020 00:48:07 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dt-bindings: mxsfb: Add compatible for i.MX8MM
Date: Sun,  4 Oct 2020 00:48:01 +0200
Message-Id: <20201003224801.164112-1-marex@denx.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 05 Oct 2020 07:22:30 +0000
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TlhQJ3MgaS5NWDhNTSBoYXMgYW4gTENESUYgYXMgd2VsbC4KClNpZ25lZC1vZmYtYnk6IE1hcmVr
IFZhc3V0IDxtYXJleEBkZW54LmRlPgpDYzogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwu
Y29tPgpDYzogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KQ2M6IEx1Y2FzIFN0YWNo
IDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgpDYzogTlhQIExpbnV4IFRlYW0gPGxpbnV4LWlteEBu
eHAuY29tPgpDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4KQ2M6IFNoYXduIEd1
byA8c2hhd25ndW9Aa2VybmVsLm9yZz4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9teHNmYi50eHQgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L214c2ZiLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L214c2ZiLnR4dAppbmRleCBjOTg1ODcxYzQ2YjMuLmYyZjRhODE4OWVkYSAxMDA2NDQKLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXhzZmIudHh0CisrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L214c2ZiLnR4dApAQCAt
Niw2ICs2LDcgQEAgUmVxdWlyZWQgcHJvcGVydGllczoKIC0gY29tcGF0aWJsZToJU2hvdWxkIGJl
ICJmc2wsaW14MjMtbGNkaWYiIGZvciBpLk1YMjMuCiAJCVNob3VsZCBiZSAiZnNsLGlteDI4LWxj
ZGlmIiBmb3IgaS5NWDI4LgogCQlTaG91bGQgYmUgImZzbCxpbXg2c3gtbGNkaWYiIGZvciBpLk1Y
NlNYLgorCQlTaG91bGQgYmUgImZzbCxpbXg4bW0tbGNkaWYiIGZvciBpLk1YOE1NLgogCQlTaG91
bGQgYmUgImZzbCxpbXg4bXEtbGNkaWYiIGZvciBpLk1YOE1RLgogLSByZWc6CQlBZGRyZXNzIGFu
ZCBsZW5ndGggb2YgdGhlIHJlZ2lzdGVyIHNldCBmb3IgTENESUYKIC0gaW50ZXJydXB0czoJU2hv
dWxkIGNvbnRhaW4gTENESUYgaW50ZXJydXB0Ci0tIAoyLjI4LjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
