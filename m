Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC2E56412
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5B46E2CA;
	Wed, 26 Jun 2019 08:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8F689FCC
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 12:50:13 +0000 (UTC)
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:37978 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1hfkti-0006WM-Oy; Tue, 25 Jun 2019 13:50:06 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim
 4.82_1-5b7a7c0-XX) (envelope-from <rmk@armlinux.org.uk>)
 id 1hfkti-0008CF-4q; Tue, 25 Jun 2019 13:50:06 +0100
Date: Tue, 25 Jun 2019 13:50:06 +0100
From: Russell King <rmk@armlinux.org.uk>
To: David Airlie <airlied@linux.ie>
Subject: [GIT PULL] TDA998x development updates
Message-ID: <20190625125005.GA31503@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=se2G3IS5Uj9zf1sOOflvVI3K0JuC4Jkc5uuHVI7D3Jo=; b=jR7MR0B8iNjqBlurwAauImteZq
 iv99hQVg+oqa4fT8by2unhSeFRE97JrJjvHtIVzPCBC9upeIDn8k+2tDk7Wfoisz8Hd/2x2Mmz0t0
 uGHJjMF/GRnj4afMeHdX/pUvbOffqVVRfhxvUxONz6JYrDlCS7mR/R0zt9pGi2i0zE2GsvvQ0dinK
 8WVqTgSqz52w8LfyswRWYPXhm2Ri997NJ8rbC3BuCvvD7rIwXns5i+T9LTa+QKNhBNKB8wV+SO1mz
 i35V7up9lSMiw933c0Q0nlzBrr9MFUnAmTEnqi37CAB7ehFcoLuQrfp+DzZUX+AKW5lld+3LcFGIw
 CfcJEjMQ==;
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2aWQsCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGU5M2M5Yzk5YTYy
OWM2MTgzN2Q1YTdmYzIxMjBjZDJiNmM3MGRiZGQ6CgogIExpbnV4IDUuMSAoMjAxOS0wNS0wNSAx
Nzo0Mjo1OCAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIGdpdCByZXBvc2l0b3J5IGF0OgoK
ICBnaXQ6Ly9naXQuYXJtbGludXgub3JnLnVrL35ybWsvbGludXgtYXJtLmdpdCB0YWdzL2Zvci1h
aXJsaWUtdGRhOTk4eAoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDQ1YTE5ZGQzOTc4
ODZhOTU5MTExMGMwZTliYTdlMDU4MzkzYTM5NWQ6CgogIGRybS9pMmM6IHRkYTk5OHg6IGFkZCB2
ZW5kb3Igc3BlY2lmaWMgaW5mb2ZyYW1lIHN1cHBvcnQgKDIwMTktMDYtMTMgMjE6NTU6MTIgKzAx
MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tClREQTk5OHggdXBkYXRlczoKLSBpbXByb3ZlIHRoZSBkcml2ZXIncyBhcHBy
b2FjaCB0byBhdWRpbywgYWRkaW5nIHN1cHBvcnQgZm9yIG1vcmUgSTJTCiAgYmFzZWQgZm9ybWF0
cywgcGFydGljdWxhcmx5IG90aGVyIGp1c3RpZmljYXRpb25zLCBhbmQgcHJlcGFyaW5nIHRoZQog
IGRyaXZlciB0byBzdXBwb3J0IG90aGVyIGJjbGsgcmF0aW9zLgoKLSBhZGQgc3VwcG9ydCBmb3Ig
cGl4ZWwgcmVwZWF0ZWQgbW9kZXMsIHRlc3RlZCB3aXRoIGEgUGFuYXNvbmljIFRWLgoKLSBjb3Jy
ZWN0IHRoZSBxdWFudGlzYXRpb24gcmFuZ2UgaGFuZGxpbmc7IGluIHBhcnRpY3VsYXIsIGRvIG5v
dCBzZW5kCiAgZnVsbCByYW5nZSBSR0IgdG8gdGhlIHNpbmsgd2hlbiB0aGUgc2luayBkb2VzIG5v
dCBzdXBwb3J0IGZ1bGwgcmFuZ2UKICBSR0IuCgotIFNlbmQgdGhlIEhETUkgdmVuZG9yIGluZm8g
ZnJhbWUgd2hlbiByZXF1aXJlZC4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUnVzc2VsbCBLaW5nICgxMyk6CiAgICAgIGRy
bS9pMmM6IHRkYTk5OHg6IGludHJvZHVjZSB0ZGE5OTh4X2F1ZGlvX3NldHRpbmdzCiAgICAgIGRy
bS9pMmM6IHRkYTk5OHg6IGltcGxlbWVudCBkaWZmZXJlbnQgSTJTIGZsYXZvdXJzCiAgICAgIGRy
bS9pMmM6IHRkYTk5OHg6IGltcHJvdmUgcHJvZ3JhbW1pbmcgb2YgYXVkaW8gZGl2aXNvcgogICAg
ICBkcm0vaTJjOiB0ZGE5OTh4OiBkZXJpdmUgQ1RTX04gdmFsdWUgZnJvbSBhY2xrIHNhbXBsZSBy
YXRlIHJhdGlvCiAgICAgIGRybS9pMmM6IHRkYTk5OHg6IHN0b3JlIGF1ZGlvIHBvcnQgZW5hYmxl
IGluIHNldHRpbmdzCiAgICAgIGRybS9pMmM6IHRkYTk5OHg6IGluZGV4IGF1ZGlvIHBvcnQgZW5h
YmxlIGNvbmZpZyBieSByb3V0ZSB0eXBlCiAgICAgIGRybS9pMmM6IHRkYTk5OHg6IGNvbmZpZ3Vy
ZSBib3RoIGZpZWxkcyBvZiBBSVBfQ0xLU0VMIHRvZ2V0aGVyCiAgICAgIGRybS9pMmM6IHRkYTk5
OHg6IG1vdmUgYXVkaW8gcm91dGluZyBjb25maWd1cmF0aW9uCiAgICAgIGRybS9pMmM6IHRkYTk5
OHg6IGNsZWFuIHVwIHRkYTk5OHhfY29uZmlndXJlX2F1ZGlvKCkKICAgICAgZHJtL2kyYzogdGRh
OTk4eDogZ2V0IHJpZCBvZiBwYXJhbXMgaW4gYXVkaW8gc2V0dGluZ3MKICAgICAgZHJtL2kyYzog
dGRhOTk4eDogYWRkIHN1cHBvcnQgZm9yIHBpeGVsIHJlcGVhdGVkIG1vZGVzCiAgICAgIGRybS9p
MmM6IHRkYTk5OHg6IGltcHJvdmUgY29ycmVjdG5lc3Mgb2YgcXVhbnRpc2F0aW9uIHJhbmdlCiAg
ICAgIGRybS9pMmM6IHRkYTk5OHg6IGFkZCB2ZW5kb3Igc3BlY2lmaWMgaW5mb2ZyYW1lIHN1cHBv
cnQKCiBkcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5OHhfZHJ2LmMgfCA0NTAgKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzMDIgaW5zZXJ0aW9u
cygrKSwgMTQ4IGRlbGV0aW9ucygtKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
