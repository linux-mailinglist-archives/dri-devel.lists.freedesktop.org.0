Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0FCF05F0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 20:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FCB6EB5C;
	Tue,  5 Nov 2019 19:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C956E0C8
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 18:35:11 +0000 (UTC)
Received: from ramsan ([84.195.182.253]) by xavier.telenet-ops.be with bizsmtp
 id NJb62100s5USYZQ01Jb6By; Tue, 05 Nov 2019 19:35:08 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iS3fW-0002sI-Ke; Tue, 05 Nov 2019 19:35:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iS3fW-0005aj-JH; Tue, 05 Nov 2019 19:35:06 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 1/3] dt-bindings: display: renesas: du: Add vendor prefix to
 vsps property
Date: Tue,  5 Nov 2019 19:35:02 +0100
Message-Id: <20191105183504.21447-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191105183504.21447-1-geert+renesas@glider.be>
References: <20191105183504.21447-1-geert+renesas@glider.be>
X-Mailman-Approved-At: Tue, 05 Nov 2019 19:26:40 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFJlbmVzYXMtc3BlY2lmaWMgInZzcHMiIHByb3BlcnR5IGxhY2tzIGEgdmVuZG9yIHByZWZp
eC4KQWRkIGEgInJlbmVzYXMsIiBwcmVmaXggdG8gY29tcGx5IHdpdGggRFQgYmVzdCBwcmFjdGlz
ZXMuCgpNb3ZlICJyZW5lc2FzLHZzcHMiIGJlbG93ICJyZW5lc2FzLGNtbXMiIHRvIHByZXNlcnZl
IGFscGhhYmV0aWNhbCBzb3J0Cm9yZGVyLgoKRml4ZXM6IDA2NzExZTYzODVhNGFiNGMgKCJkcm06
IHJjYXItZHU6IERvY3VtZW50IHRoZSB2c3BzIHByb3BlcnR5IGluIHRoZSBEVCBiaW5kaW5ncyIp
ClNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIu
YmU+Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGR1LnR4dCAg
ICAgICB8IDEyICsrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9yZW5lc2FzLGR1LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsZHUudHh0CmluZGV4IGY2ZmRhYTY3YzI1N2EwNDYuLmVi
NGFlNDFmZTQxZjgzYzcgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3JlbmVzYXMsZHUudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsZHUudHh0CkBAIC00MSwxNSArNDEsMTUgQEAgUmVx
dWlyZWQgUHJvcGVydGllczoKICAgICAgIHN1cHBsaWVkIHRoZXkgbXVzdCBiZSBuYW1lZCAiZGNs
a2luLngiIHdpdGggIngiIGJlaW5nIHRoZSBpbnB1dCBjbG9jawogICAgICAgbnVtZXJpY2FsIGlu
ZGV4LgogCi0gIC0gdnNwczogQSBsaXN0IG9mIHBoYW5kbGUgYW5kIGNoYW5uZWwgaW5kZXggdHVw
bGVzIHRvIHRoZSBWU1BzIHRoYXQgaGFuZGxlCi0gICAgdGhlIG1lbW9yeSBpbnRlcmZhY2VzIGZv
ciB0aGUgRFUgY2hhbm5lbHMuIFRoZSBwaGFuZGxlIGlkZW50aWZpZXMgdGhlIFZTUAotICAgIGlu
c3RhbmNlIHRoYXQgc2VydmVzIHRoZSBEVSBjaGFubmVsLCBhbmQgdGhlIGNoYW5uZWwgaW5kZXgg
aWRlbnRpZmllcyB0aGUKLSAgICBMSUYgaW5zdGFuY2UgaW4gdGhhdCBWU1AuCi0KICAgLSByZW5l
c2FzLGNtbXM6IEEgbGlzdCBvZiBwaGFuZGxlcyB0byB0aGUgQ01NIGluc3RhbmNlcyBwcmVzZW50
IGluIHRoZSBTb0MsCiAgICAgb25lIGZvciBlYWNoIGF2YWlsYWJsZSBEVSBjaGFubmVsLiBUaGUg
cHJvcGVydHkgc2hhbGwgbm90IGJlIHNwZWNpZmllZCBmb3IKICAgICBTb0NzIHRoYXQgZG8gbm90
IHByb3ZpZGUgYW55IENNTSAoc3VjaCBhcyBWM00gYW5kIFYzSCkuCiAKKyAgLSByZW5lc2FzLHZz
cHM6IEEgbGlzdCBvZiBwaGFuZGxlIGFuZCBjaGFubmVsIGluZGV4IHR1cGxlcyB0byB0aGUgVlNQ
cyB0aGF0CisgICAgaGFuZGxlIHRoZSBtZW1vcnkgaW50ZXJmYWNlcyBmb3IgdGhlIERVIGNoYW5u
ZWxzLiBUaGUgcGhhbmRsZSBpZGVudGlmaWVzIHRoZQorICAgIFZTUCBpbnN0YW5jZSB0aGF0IHNl
cnZlcyB0aGUgRFUgY2hhbm5lbCwgYW5kIHRoZSBjaGFubmVsIGluZGV4IGlkZW50aWZpZXMKKyAg
ICB0aGUgTElGIGluc3RhbmNlIGluIHRoYXQgVlNQLgorCiBSZXF1aXJlZCBub2RlczoKIAogVGhl
IGNvbm5lY3Rpb25zIHRvIHRoZSBEVSBvdXRwdXQgdmlkZW8gcG9ydHMgYXJlIG1vZGVsZWQgdXNp
bmcgdGhlIE9GIGdyYXBoCkBAIC05Niw4ICs5Niw4IEBAIEV4YW1wbGU6IFI4QTc3OTUgKFItQ2Fy
IEgzKSBFUzIuMCBEVQogCQkJIDwmY3BnIENQR19NT0QgNzIyPiwKIAkJCSA8JmNwZyBDUEdfTU9E
IDcyMT47CiAJCWNsb2NrLW5hbWVzID0gImR1LjAiLCAiZHUuMSIsICJkdS4yIiwgImR1LjMiOwot
CQl2c3BzID0gPCZ2c3BkMCAwPiwgPCZ2c3BkMSAwPiwgPCZ2c3BkMiAwPiwgPCZ2c3BkMCAxPjsK
IAkJcmVuZXNhcyxjbW1zID0gPCZjbW0wPiwgPCZjbW0xPiwgPCZjbW0yPiwgPCZjbW0zPjsKKwkJ
cmVuZXNhcyx2c3BzID0gPCZ2c3BkMCAwPiwgPCZ2c3BkMSAwPiwgPCZ2c3BkMiAwPiwgPCZ2c3Bk
MCAxPjsKIAogCQlwb3J0cyB7CiAJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
