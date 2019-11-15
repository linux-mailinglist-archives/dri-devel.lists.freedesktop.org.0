Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57057FE69E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 21:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E447F6EAA8;
	Fri, 15 Nov 2019 20:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DB26EAA8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 20:53:05 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id k13so11867783ioa.9
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 12:53:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vImTrTVibqRfQfgQuhEO4MyEcUHOV2nDxdVqGngF8v0=;
 b=kO/PqEumXhgZkILmf7dnqYfmEWE+7SeytjGHp4wST5VflYVZFNmxziqHSTDCXlnxRI
 lIiW002nhIJkoFAuJtFqcpnFTs7ejPuEzpVb2n9O+lrGtGZU2gl0/oroJ075P8gxQlXd
 gT9FEsCTsbnBxt6vq9ivOKX36biTJ90pB1OFeK/PogGjHF2hDwUE0TbpB2kTxr++YMYD
 q/X5P1Fsf3b21OvRQGv7B/d2LR5pK4AeOoFrlFHta+uyXcvKjzYMFCNb1SLuM7+PpQZ7
 GPnkkjsAUp4zJ52locSrJDXgIfKJQyrHcRoP54piG6NlOPuDv+LhFMPZPF9MlBcA/P2n
 kE1w==
X-Gm-Message-State: APjAAAU5YNym/qaz3XL6L9+VeVwLRpcamaAulUJ9GsaFNG8bIML8LnSa
 a0CHRxKciINf0wdhNU/DzzNrR+1M5wA=
X-Google-Smtp-Source: APXvYqyviRJ19kDlfojhleLQfBKXhw3+sY7knQBUJcFs6SPpSV1Ho8V9oqgZxba+3+mCwoKsCDTkEg==
X-Received: by 2002:a5d:8b99:: with SMTP id p25mr2663675iol.41.1573851185112; 
 Fri, 15 Nov 2019 12:53:05 -0800 (PST)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id x8sm1356117iol.15.2019.11.15.12.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 12:53:04 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: Remove myself from drm-misc entry
Date: Fri, 15 Nov 2019 15:52:36 -0500
Message-Id: <20191115205302.246625-1-sean@poorly.run>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vImTrTVibqRfQfgQuhEO4MyEcUHOV2nDxdVqGngF8v0=;
 b=Xw2Mh63EQjSPmviIGFBPLHKEWOoU868UETg4TGsFkhrQhjt+M400sJzBQBls6Cqxl2
 cmp5ep3/yz20hBH9SiH4UQfITTURb6mVKHVrLUoN2g6LAQy2tJ9lPfGngPADx5GczFWp
 q2vmHTpN7D7S+qSHEbJ4TMuUqdwPXXbP1Byc23LY9kxX4GMRIrH9igdJnDFgHK297nQ5
 mabvz59VvS+WLKNpqvOJTgvUM6g5MzefQPmI44DqsKTF6KMMvW60nBF6I872DfNUdBo0
 syRQ5/0jWRZzrfyLSeoMe7hentuLcrZi2oIkiYbQQNh3PKm/qYHR51KNkrpR6TzIbQ30
 eK0A==
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
Cc: Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2M6IERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBs
aW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+ClNp
Z25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgotLS0KCkkgbmVlZCB0byBz
dGVwIGF3YXkgZnJvbSAtbWlzYyB0byBwcmlvcml0aXplIG90aGVyIHdvcmsgdGhhdCBJIGhhdmUg
b24KbXkgcGxhdGUuIEl0J3MgYmVlbiBncmVhdCBmdW4gKG1vc3Qgb2YgdGhlIHRpbWUpIGFuZCB2
ZXJ5IHJld2FyZGluZwpkb2luZyB0aGlzIGpvYi4gSSB3aWxsIHJlYWxseSBtaXNzIGl0IQoKSSBw
bGFuIG9uIHRoZSA1LjUgcmVsZWFzZSBiZWluZyBteSBsYXN0IG9uZSBiZWZvcmUgdHJhbnNpdGlv
bmluZyB0byBteQpuZXcgcm9sZSBhcyBjb21taXR0ZXIgOi0pCgpTZWFuCgoKIE1BSU5UQUlORVJT
IHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL01BSU5U
QUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggYjYzYzI5MWFkMDI5Li5jMmI4OTQ1MzgwNWYgMTAw
NjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC01MzYyLDcgKzUzNjIs
NiBAQCBGOglpbmNsdWRlL2xpbnV4L3ZnYSoKIERSTSBEUklWRVJTIEFORCBNSVNDIEdQVSBQQVRD
SEVTCiBNOglNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwu
Y29tPgogTToJTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgotTToJU2VhbiBQYXVs
IDxzZWFuQHBvb3JseS5ydW4+CiBXOglodHRwczovLzAxLm9yZy9saW51eGdyYXBoaWNzL2dmeC1k
b2NzL21haW50YWluZXItdG9vbHMvZHJtLW1pc2MuaHRtbAogUzoJTWFpbnRhaW5lZAogVDoJZ2l0
IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYwotLSAKU2VhbiBQYXVs
LCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
