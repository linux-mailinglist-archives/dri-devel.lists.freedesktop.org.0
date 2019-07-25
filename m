Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D308A76266
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6516ECEB;
	Fri, 26 Jul 2019 09:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 556266E76A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 14:53:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 136E728;
 Thu, 25 Jul 2019 07:53:24 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com
 [10.1.194.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B26E83F71F;
 Thu, 25 Jul 2019 07:53:22 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: fast models: Increase clcd's max-memory-bandwidth
Date: Thu, 25 Jul 2019 15:50:40 +0100
Message-Id: <20190725145040.42182-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
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
Cc: devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>,
 Ruben Ayrapetyan <ruben.ayrapetyan@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgbWF5IGJlIGRlc2lyYWJsZSBvbiBjZXJ0YWluIHBsYXRmb3Jtcywgc3VjaCBhcyBBbmRyb2lk
LCB0bwp1c2UgMzJicHAgYnVmZmVycy4gU2luY2UgdGhlcmUgaXMgbm8gY2xlYXIgYmFuZHdpZHRo
IGxpbWl0IGZvciB0aGUKQ0xDRCBjb21wb25lbnQgb24gdGhlIGZhc3QgbW9kZWwsIGxldCdzIGlu
Y3JlYXNlCm1heC1tZW1vcnktYmFuZHdpZHRoIHRvIGFsbG93IHVzaW5nIDMyYnBwIGJ1ZmZlcnMu
CgpSZXBvcnRlZC1ieTogUnViZW4gQXlyYXBldHlhbiA8cnViZW4uYXlyYXBldHlhbkBhcm0uY29t
PgpTaWduZWQtb2ZmLWJ5OiBLZXZpbiBCcm9kc2t5IDxrZXZpbi5icm9kc2t5QGFybS5jb20+Ci0t
LQogYXJjaC9hcm02NC9ib290L2R0cy9hcm0vZnZwLWJhc2UtcmV2Yy5kdHMgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL2FybS9mdnAtYmFzZS1yZXZjLmR0cyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvYXJtL2Z2cC1iYXNlLXJldmMuZHRzCmluZGV4IDY4NzcwNzAyMGVjMS4uM2FlZTQ5ZWQ2
ZDg4IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FybS9mdnAtYmFzZS1yZXZjLmR0
cworKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FybS9mdnAtYmFzZS1yZXZjLmR0cwpAQCAtMjY5
LDcgKzI2OSw3IEBACiAJCW1vdGhlcmJvYXJkIHsKIAkJCWlvZnBnYUAzLDAwMDAwMDAwIHsKIAkJ
CQljbGNkQDFmMDAwMCB7Ci0JCQkJCW1heC1tZW1vcnktYmFuZHdpZHRoID0gPDEzMDAwMDAwMD47
IC8qIDE2YnBwIEAgNjMuNU1IeiAqLworCQkJCQltYXgtbWVtb3J5LWJhbmR3aWR0aCA9IDwyNjAw
MDAwMDA+OyAvKiAzMmJwcCBAIDYzLjVNSHogKi8KIAkJCQl9OwogCQkJfTsKIAkJfTsKLS0gCjIu
MjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
