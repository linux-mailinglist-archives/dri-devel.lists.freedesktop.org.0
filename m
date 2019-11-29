Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A80D10DDBB
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 14:24:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5666E11F;
	Sat, 30 Nov 2019 13:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-blr-02.qualcomm.com (alexa-out-blr-02.qualcomm.com
 [103.229.18.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4F06E892;
 Fri, 29 Nov 2019 06:56:54 +0000 (UTC)
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA;
 29 Nov 2019 12:26:15 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.147])
 by ironmsg01-blr.qualcomm.com with ESMTP; 29 Nov 2019 12:25:54 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
 id F2D472346; Fri, 29 Nov 2019 12:25:53 +0530 (IST)
From: Harigovindan P <harigovi@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: display: add sc7180 panel variant
Date: Fri, 29 Nov 2019 12:25:44 +0530
Message-Id: <1575010545-25971-2-git-send-email-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575010545-25971-1-git-send-email-harigovi@codeaurora.org>
References: <1575010545-25971-1-git-send-email-harigovi@codeaurora.org>
X-Mailman-Approved-At: Sat, 30 Nov 2019 13:23:59 +0000
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
Cc: Harigovindan P <harigovi@codeaurora.org>, abhinavk@codeaurora.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org, hoegsberg@chromium.org,
 chandanu@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGEgY29tcGF0aWJsZSBzdHJpbmcgdG8gc3VwcG9ydCBzYzcxODAgcGFuZWwgdmVyc2lvbi4K
ClNpZ25lZC1vZmYtYnk6IEhhcmlnb3ZpbmRhbiBQIDxoYXJpZ292aUBjb2RlYXVyb3JhLm9yZz4K
LS0tCiAuLi4vYmluZGluZ3MvZGlzcGxheS92aXNpb25veCxybTY5Mjk5LnR4dCAgICAgICAgICB8
IDY4ICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2OCBpbnNlcnRpb25z
KCspCiBjcmVhdGUgbW9kZSAxMDA3NTUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvdmlzaW9ub3gscm02OTI5OS50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS92aXNpb25veCxybTY5Mjk5LnR4dCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Zpc2lvbm94LHJtNjkyOTkudHh0
Cm5ldyBmaWxlIG1vZGUgMTAwNzU1CmluZGV4IDAwMDAwMDAuLjQ2MjIxOTEKLS0tIC9kZXYvbnVs
bAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS92aXNpb25v
eCxybTY5Mjk5LnR4dApAQCAtMCwwICsxLDY4IEBACitWaXNpb25veCBtb2RlbCBSTTY5Mjk5IERT
SSBkaXNwbGF5IGRyaXZlcgorCitUaGUgVmlzaW9ub3ggUk02OTI5OSBpcyBhIGdlbmVyaWMgZGlz
cGxheSBkcml2ZXIsIGN1cnJlbnRseSBvbmx5IGNvbmZpZ3VyZWQKK2ZvciB1c2UgaW4gdGhlIDEw
ODBwIGRpc3BsYXkgb24gdGhlIFF1YWxjb21tIFNDNzE4MCBNVFAgYm9hcmQuCisKK1JlcXVpcmVk
IHByb3BlcnRpZXM6CistIGNvbXBhdGlibGU6IHNob3VsZCBiZSAidmlzaW9ub3gscm02OTI5OS0x
MDgwcC1kaXNwbGF5IgorLSB2ZGRhLXN1cHBseTogcGhhbmRsZSBvZiB0aGUgcmVndWxhdG9yIHRo
YXQgcHJvdmlkZXMgdGhlIHN1cHBseSB2b2x0YWdlCisgIFBvd2VyIElDIHN1cHBseQorLSB2ZGQz
cDMtc3VwcGx5OiBwaGFuZGxlIG9mIHRoZSByZWd1bGF0b3IgdGhhdCBwcm92aWRlcyB0aGUgc3Vw
cGx5IHZvbHRhZ2UKKyAgUG93ZXIgSUMgc3VwcGx5CistIHJlc2V0LWdwaW9zOiBwaGFuZGxlIG9m
IGdwaW8gZm9yIHJlc2V0IGxpbmUKKyAgVGhpcyBzaG91bGQgYmUgOG1BLCBncGlvIGNhbiBiZSBj
b25maWd1cmVkIHVzaW5nIG11eCwgcGluY3RybCwgcGluY3RybC1uYW1lcworICAoYWN0aXZlIGxv
dykKKy0gbW9kZS1ncGlvczogcGhhbmRsZSBvZiB0aGUgZ3BpbyBmb3IgY2hvb3NpbmcgdGhlIG1v
ZGUgb2YgdGhlIGRpc3BsYXkKKyAgZm9yIHNpbmdsZSBEU0kKKy0gcG9ydHM6IFRoaXMgZGV2aWNl
IGhhcyBvbmUgdmlkZW8gcG9ydCBkcml2ZW4gYnkgb25lIERTSS4gVGhlaXIgY29ubmVjdGlvbnMK
KyAgYXJlIG1vZGVsZWQgdXNpbmcgdGhlIE9GIGdyYXBoIGJpbmRpbmdzIHNwZWNpZmllZCBpbgor
ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3JhcGgudHh0LgorICAtIHBvcnRA
MDogRFNJIGlucHV0IHBvcnQgZHJpdmVuIGJ5IG1hc3RlciBEU0kKKworRXhhbXBsZToKKworCWRz
aUBhZTk0MDAwIHsKKwkJcGFuZWxAMCB7CisJCQljb21wYXRpYmxlID0gInZpc2lvbm94LHJtNjky
OTktMTA4MHAtZGlzcGxheSI7CisJCQlyZWcgPSA8MD47CisKKwkJCXZkZGEtc3VwcGx5ID0gPCZz
cmNfcHAxODAwX2w4Yz47CisJCQl2ZGQzcDMtc3VwcGx5ID0gPCZzcmNfcHAyODAwX2wxOGE+Owor
CisJCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiLCAic3VzcGVuZCI7CisJCQlwaW5jdHJsLTAg
PSA8JmRpc3BfcGluc19kZWZhdWx0PjsKKwkJCXBpbmN0cmwtMSA9IDwmZGlzcF9waW5zX2RlZmF1
bHQ+OworCisJCQlyZXNldC1ncGlvcyA9IDwmcG02MTUwbF9ncGlvcyAzIDA+OworCisJCQlkaXNw
bGF5LXRpbWluZ3MgeworCQkJCXRpbWluZzA6IHRpbWluZy0wIHsKKwkJCQkJLyogb3JpZ2luYWxs
eQorCQkJCQkgKiAyNjgzMTYxNjAgTWh6LAorCQkJCQkgKiBidXQgdmFsdWUgYmVsb3cgZml0cwor
CQkJCQkgKiBiZXR0ZXIgdy8gZG93bnN0cmVhbQorCQkJCQkgKi8KKwkJCQkJY2xvY2stZnJlcXVl
bmN5ID0gPDE1ODY5NTY4MD47CisJCQkJCWhhY3RpdmUgPSA8MTA4MD47CisJCQkJCXZhY3RpdmUg
PSA8MjI0OD47CisJCQkJCWhmcm9udC1wb3JjaCA9IDwyNj47CisJCQkJCWhiYWNrLXBvcmNoID0g
PDM2PjsKKwkJCQkJaHN5bmMtbGVuID0gPDI+OworCQkJCQl2ZnJvbnQtcG9yY2ggPSA8NTY+Owor
CQkJCQl2YmFjay1wb3JjaCA9IDw0PjsKKwkJCQkJdnN5bmMtbGVuID0gPDQ+OworCQkJCX07CisJ
CQl9OworCisJCQlwb3J0cyB7CisJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCQkJI3NpemUt
Y2VsbHMgPSA8MD47CisJCQkJcG9ydEAwIHsKKwkJCQkJcmVnID0gPDA+OworCQkJCQlwYW5lbDBf
aW46IGVuZHBvaW50IHsKKwkJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHNpMF9vdXQ+OworCQkJ
CQl9OworCQkJCX07CisJCQl9OworCQl9OworCX07Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
