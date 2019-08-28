Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2989FD1A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B04489D44;
	Wed, 28 Aug 2019 08:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 372 seconds by postgrey-1.36 at gabe;
 Wed, 28 Aug 2019 08:06:10 UTC
Received: from shell.v3.sk (shell.v3.sk [90.176.6.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA68896AF
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 08:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 87A09D833D;
 Wed, 28 Aug 2019 10:00:01 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 3yinYU-dRN-5; Wed, 28 Aug 2019 09:59:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id DC1DCD8333;
 Wed, 28 Aug 2019 09:59:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id vuMu0oR0fIL4; Wed, 28 Aug 2019 09:59:41 +0200 (CEST)
Received: from belphegor.brq.redhat.com (nat-pool-brq-t.redhat.com
 [213.175.37.10])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 0313BD832A;
 Wed, 28 Aug 2019 09:59:40 +0200 (CEST)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Russell King <linux@armlinux.org.uk>
Subject: [PATCH v4 0/5] dt-bindings: improve the Armada DRM bindings
Date: Wed, 28 Aug 2019 09:59:33 +0200
Message-Id: <20190828075938.318028-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgp0aGlzIGlzIHRoZSBmb3VydGggc3BpbiBvZiBhIHBhdGNoIHNldCB0aGF0IGFpbXMgdG8g
Y29tcGxldGUgdGhlIEFybWFkYQpEUk0gYmluZGluZyBkb2N1bWVudGF0aW9uLiBUaGUgb25seSBj
aGFuZ2UgZnJvbSB0aGUgbGFzdCB2ZXJzaW9uIGlzIHRoZQphZGRpdGlvbiBvZiBSZXZpZXdlZC1i
eSB0YWdzLgoKV2hhdCBpcyBkb2N1bWVudGVkIGNvcnJlc3BvbmRzIHRvIHRoZSBhcm1hZGEtZGV2
ZWwgYnJhbmNoIG9mCmdpdDovL2dpdC5hcm1saW51eC5vcmcudWsvfnJtay9saW51eC1hcm0uZ2l0
IHdpdGggdGhlc2UgZGlmZmVyZW5jaWVzOgoKKiBEb2N1bWVudGF0aW9uIG9mIHRoZSBidXMtd2lk
dGggcHJvcGVydHkgb2YgdGhlIExDREMKKiBUaGUgTU1QMiBjb21wYXRpYmxlIHN0cmluZ3MuCgpQ
YXRjaGVzIHRvIHRoZSBkcml2ZXIgZm9yIHRoZSBhYm92ZSB3ZXJlIHNlbnQgb3V0IHNlcGFyYXRl
bHkuCgpMdWJvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
