Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5020F13135
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 17:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7716E7FC;
	Fri,  3 May 2019 15:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id C734E6E7FC
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 15:32:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8802480D;
 Fri,  3 May 2019 08:32:05 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
 [10.1.196.75])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 489A53F557;
 Fri,  3 May 2019 08:32:04 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: robh@kernel.org,
	tomeu.vizoso@collabora.com
Subject: [RFC 5/4] arm64: dts: juno: add GPU subsystem
Date: Fri,  3 May 2019 16:31:46 +0100
Message-Id: <0d17a3c08fb435e54b3b5b748ac83b6a016e0525.1556896081.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
In-Reply-To: <cover.1556195258.git.robin.murphy@arm.com>
References: <cover.1556195258.git.robin.murphy@arm.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2Ugd2Ugbm93IGhhdmUgYmluZGluZ3MgZm9yIE1hbGkgTWlkZ2FyZCBHUFVzLCBsZXQncyB1
c2UgdGhlbSB0bwpkZXNjcmliZSBKdW5vJ3MgR1BVIHN1YnN5c3RlbSwgaWYgb25seSBiZWNhdXNl
IHdlIGNhbi4gSnVubyBzcG9ydHMgYQpNYWxpLVQ2MjQgaW50ZWdyYXRlZCBiZWhpbmQgYW4gTU1V
LTQwMCAoYXMgYSBnZXN0dXJlIHRvd2FyZHMKdmlydHVhbGlzYXRpb24pLCBpbiB0aGVpciBvd24g
ZGVkaWNhdGVkIHBvd2VyIGRvbWFpbiB3aXRoIERWRlMKY29udHJvbGxlZCBieSB0aGUgU0NQLgoK
U2lnbmVkLW9mZi1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KLS0tCgpK
dXN0IGluIGNhc2UgYW55b25lIGVsc2UgaXMgaW50ZXJlc3RlZC4gTm90ZSB0aGF0IEkndmUgbm90
IGJlZW4gdXNpbmcKdGhpcyBleGFjdCBwYXRjaCwgc2luY2UgbXkgSnVubyBpcyBydW5uaW5nIHRo
ZSBuZXcgU0NNSS1iYXNlZCBmaXJtd2FyZQp3aGljaCBuZWVkcyBub3QteWV0LXVwc3RyZWFtIE1I
VSBjaGFuZ2VzLCBidXQgdGhpcyBzaG91bGQgaW4gdGhlb3J5IGJlCnRoZSBlcXVpdmFsZW50IGNo
YW5nZSBmb3IgdGhlIHVwc3RyZWFtIFNDUEktYmFzZWQgRFQuCgogLi4uL2JpbmRpbmdzL2dwdS9h
cm0sbWFsaS1taWRnYXJkLnR4dCAgICAgICAgIHwgIDEgKwogYXJjaC9hcm02NC9ib290L2R0cy9h
cm0vanVuby1iYXNlLmR0c2kgICAgICAgIHwgMjUgKysrKysrKysrKysrKysrKysrKwogMiBmaWxl
cyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4dCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlkZ2FyZC50eHQKaW5kZXggMThh
MmNkZTJlNWYzLi5jMTdmOGU5NmQxZTYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlkZ2FyZC50eHQKKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4dApAQCAtMTYsNiAr
MTYsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogICAgICsgImFybSxtYWxpLXQ4ODAiCiAgICog
d2hpY2ggbXVzdCBiZSBwcmVjZWRlZCBieSBvbmUgb2YgdGhlIGZvbGxvd2luZyB2ZW5kb3Igc3Bl
Y2lmaWNzOgogICAgICsgImFtbG9naWMsbWVzb24tZ3htLW1hbGkiCisgICAgKyAiYXJtLGp1bm8t
bWFsaSIKICAgICArICJyb2NrY2hpcCxyazMyODgtbWFsaSIKICAgICArICJyb2NrY2hpcCxyazMz
OTktbWFsaSIKIApkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hcm0vanVuby1iYXNl
LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FybS9qdW5vLWJhc2UuZHRzaQppbmRleCA5OTVh
NzEwN2NkZDMuLjZlZGFmMDM2MjBmOSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9h
cm0vanVuby1iYXNlLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hcm0vanVuby1iYXNl
LmR0c2kKQEAgLTM1LDYgKzM1LDE4IEBACiAJCWNsb2NrLW5hbWVzID0gImFwYl9wY2xrIjsKIAl9
OwogCisJc21tdV9ncHU6IGlvbW11QDJiNDAwMDAwIHsKKwkJY29tcGF0aWJsZSA9ICJhcm0sbW11
LTQwMCIsICJhcm0sc21tdS12MSI7CisJCXJlZyA9IDwweDAgMHgyYjQwMDAwMCAweDAgMHgxMDAw
MD47CisJCWludGVycnVwdHMgPSA8R0lDX1NQSSAzOCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJ
CSAgICAgPEdJQ19TUEkgMzggSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCSNpb21tdS1jZWxscyA9
IDwxPjsKKwkJI2dsb2JhbC1pbnRlcnJ1cHRzID0gPDE+OworCQlwb3dlci1kb21haW5zID0gPCZz
Y3BpX2RldnBkIDM+OworCQlkbWEtY29oZXJlbnQ7CisJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJ
fTsKKwogCXNtbXVfcGNpZTogaW9tbXVAMmI1MDAwMDAgewogCQljb21wYXRpYmxlID0gImFybSxt
bXUtNDAxIiwgImFybSxzbW11LXYxIjsKIAkJcmVnID0gPDB4MCAweDJiNTAwMDAwIDB4MCAweDEw
MDAwPjsKQEAgLTQ4Nyw2ICs0OTksMTkgQEAKIAkJfTsKIAl9OwogCisJZ3B1OiBncHVAMmQwMDAw
MDAgeworCQljb21wYXRpYmxlID0gImFybSxqdW5vLW1hbGkiLCAiYXJtLG1hbGktdDYyNCI7CisJ
CXJlZyA9IDwwIDB4MmQwMDAwMDAgMCAweDEwMDAwPjsKKwkJaW50ZXJydXB0cyA9IDxHSUNfU1BJ
IDMyIElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJICAgICA8R0lDX1NQSSAzMyBJUlFfVFlQRV9M
RVZFTF9ISUdIPiwKKwkJCSAgICAgPEdJQ19TUEkgMzQgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJ
CWludGVycnVwdC1uYW1lcyA9ICJncHUiLCAiam9iIiwgIm1tdSI7CisJCWNsb2NrcyA9IDwmc2Nw
aV9kdmZzIDI+OworCQlwb3dlci1kb21haW5zID0gPCZzY3BpX2RldnBkIDM+OworCQlkbWEtY29o
ZXJlbnQ7CisJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJfTsKKwogCXNyYW06IHNyYW1AMmUwMDAw
MDAgewogCQljb21wYXRpYmxlID0gImFybSxqdW5vLXNyYW0tbnMiLCAibW1pby1zcmFtIjsKIAkJ
cmVnID0gPDB4MCAweDJlMDAwMDAwIDB4MCAweDgwMDA+OwotLSAKMi4yMS4wLmRpcnR5CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
