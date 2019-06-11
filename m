Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B4E41CB5
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D18289232;
	Wed, 12 Jun 2019 06:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1459 seconds by postgrey-1.36 at gabe;
 Tue, 11 Jun 2019 07:45:08 UTC
Received: from shell.v3.sk (shell.v3.sk [90.176.6.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAD38914F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 07:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 20379104F72;
 Tue, 11 Jun 2019 09:20:47 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id c94Kwsjfvn8S; Tue, 11 Jun 2019 09:20:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 2D4E0104F6F;
 Tue, 11 Jun 2019 09:20:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id rt3DvtvimL0t; Tue, 11 Jun 2019 09:20:28 +0200 (CEST)
Received: from belphegor.brq.redhat.com (nat-pool-brq-t.redhat.com
 [213.175.37.10])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 4D31B104F7F;
 Tue, 11 Jun 2019 09:20:27 +0200 (CEST)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH] backlight: tdo24m: Switch to SPDX header
Date: Tue, 11 Jun 2019 09:20:23 +0200
Message-Id: <20190611072023.2978679-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:41 +0000
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
Cc: Lubomir Rintel <lkundrak@v3.sk>, Eric Miao <eric.miao@marvell.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG9yaWdpbmFsIGxpY2Vuc2UgdGV4dCBoYWQgYSB0eXBvICgicHVibGlzaGhlZCIpIHdoaWNo
IHdvdWxkIGJlCmxpa2VseSB0byBjb25mdXNlIGF1dG9tYXRlZCBsaWNlbnNpbmcgYXVkaXRpbmcg
dG9vbHMuIExldCdzIGp1c3Qgc3dpdGNoCnRvIFNQRFggaW5zdGVhZCBvZiBmaXhpbmcgdGhlIHdv
cmRpbmcuCgpTaWduZWQtb2ZmLWJ5OiBMdWJvbWlyIFJpbnRlbCA8bGt1bmRyYWtAdjMuc2s+Ci0t
LQogZHJpdmVycy92aWRlby9iYWNrbGlnaHQvdGRvMjRtLmMgfCA1ICstLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvdGRvMjRtLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC90ZG8y
NG0uYwppbmRleCBlNGJkNjNlOWRiNmIuLjhjODRmMTY4ZDhkMSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvdGRvMjRtLmMKKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
dGRvMjRtLmMKQEAgLTEsMTIgKzEsOSBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAKIC8qCiAgKiB0ZG8yNG0gLSBTUEktYmFzZWQgZHJpdmVycyBmb3IgVG9wcG9seSBURE8y
NE0gc2VyaWVzIExDRCBwYW5lbHMKICAqCiAgKiBDb3B5cmlnaHQgKEMpIDIwMDggTWFydmVsbCBJ
bnRlcm5hdGlvbmFsIEx0ZC4KICAqCUVyaWMgTWlhbyA8ZXJpYy5taWFvQG1hcnZlbGwuY29tPgot
ICoKLSAqICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1
dGUgaXQgYW5kL29yIG1vZGlmeQotICogIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdl
bmVyYWwgUHVibGljIExpY2Vuc2UgdmVyc2lvbiAyIGFzCi0gKiAgcHVibGlzaGhlZCBieSB0aGUg
RnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgogICovCiAKICNpbmNsdWRlIDxsaW51eC9tb2R1bGUu
aD4KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
