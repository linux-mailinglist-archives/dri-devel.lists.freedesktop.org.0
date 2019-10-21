Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CA1DF11C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 17:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC48C8898A;
	Mon, 21 Oct 2019 15:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C1D8898A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 15:18:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 630512084B;
 Mon, 21 Oct 2019 15:18:55 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: st,stm32-dsi: Fix white spaces
Date: Mon, 21 Oct 2019 17:18:47 +0200
Message-Id: <20191021151847.13891-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571671139;
 bh=pZPt95h86j2DHhnebWftea1csHW0nl72tOQFiaF7e7s=;
 h=From:To:Cc:Subject:Date:From;
 b=B+V5q5QOX1c1zdAcO+okPLxM00nUGbUp/oXP1f+mDySsn0k+0Oj7M+RxFdLWyYgpI
 l0d6LFMNu9gjvDJarn1j3+DhSHNH0rV6RQmhvYtfi/9UtpTeac83PnxpulmStAiFE6
 kUjEzAZSQjPsWvX23l+UNISYTzMdxvnP40evQXJM=
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtb3ZlIHVubmVlZGVkIGluZGVudGF0aW9uIGluIGJsYW5rIGxpbmUgYW5kIHNwYWNlIGF0IGVu
ZCBvZiBsaW5lLgoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJu
ZWwub3JnPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0
LHN0bTMyLWRzaS55YW1sICB8IDIgKy0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMueWFtbCB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWRzaS55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItZHNpLnlhbWwKaW5kZXgg
ZGU2Yzk5MTk4Y2JlLi4zYmU3NmQxNWJmNmMgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWRzaS55YW1sCisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWRzaS55YW1sCkBAIC0x
MDgsNyArMTA4LDcgQEAgZXhhbXBsZXM6CiAgICAgICAgIHJlc2V0cyA9IDwmcmNjIERTSV9SPjsK
ICAgICAgICAgcmVzZXQtbmFtZXMgPSAiYXBiIjsKICAgICAgICAgcGh5LWRzaS1zdXBwbHkgPSA8
JnJlZzE4PjsKLSAgICAgICAgCisKICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CiAgICAg
ICAgICNzaXplLWNlbGxzID0gPDA+OwogCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnlhbWwKaW5kZXggYTQw
MTk3YWIyODFlLi5iZjhhZDkxNmU5YjAgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMueWFtbAorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnlhbWwKQEAgLTM3
LDcgKzM3LDcgQEAgcHJvcGVydGllczoKICAgcG9ydDoKICAgICB0eXBlOiBvYmplY3QKICAgICBk
ZXNjcmlwdGlvbjoKLSAgICAgICJWaWRlbyBwb3J0IGZvciBEUEkgUkdCIG91dHB1dC4gCisgICAg
ICAiVmlkZW8gcG9ydCBmb3IgRFBJIFJHQiBvdXRwdXQuCiAgICAgICBsdGRjIGhhcyBvbmUgdmlk
ZW8gcG9ydCB3aXRoIHVwIHRvIDIgZW5kcG9pbnRzOgogICAgICAgLSBmb3IgZXh0ZXJuYWwgZHBp
IHJnYiBwYW5lbCBvciBicmlkZ2UsIHVzaW5nIGdwaW9zLgogICAgICAgLSBmb3IgaW50ZXJuYWwg
ZHBpIGlucHV0IG9mIHRoZSBNSVBJIERTSSBob3N0IGNvbnRyb2xsZXIuCi0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
