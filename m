Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BFE31CD15
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 16:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37CE6E43A;
	Tue, 16 Feb 2021 15:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2346E43A
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 15:41:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2300564DFF
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 15:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613490105;
 bh=caqZDqnO8a+c97TKcVuCHmJTxzoL8man4XvbvN4MyLc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DLWEGD0zeWGgiaBzAIltIFrM9IGnd/iDJgbBcKxr0LOWBBamB+sb+B3MEhMasHiPE
 aSWIME4nSs4s6FCkw6o+B96uM3tsal3N2sLsDBJeq30JjjvN5WF37Ljq3y1iunAGTm
 MQDoW6PZiX/kBqx1J1yTAfs24+WnfFUJ89CmtvdJvTBmHxQryNUiMlJwtdU3rcrwl7
 IHH+2+ydeskjV0sM7dHrRt1Y0LASk+jrniV/+9c+VIQIDaP7AvqmpnNbsw+YgNKxWQ
 I8Pn/1iQM/xnedArR6hHy1ltiNcz6t85J9ualbvKUczuB1nUC/AM4LrsmU1XkAU/R/
 r1HEz3rFOmuBA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1E7F7653BC; Tue, 16 Feb 2021 15:41:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMDk3MTNdIGFtZGdwdSBkcml2ZXJzL2dwdS9kcm0vYW1k?=
 =?UTF-8?B?L2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2xpbmtfZW5jb2Rl?=
 =?UTF-8?B?ci5jOjQ4MyBkY24xMF9nZXRfZGlnX2Zyb250ZW5kKzB4OWUvMHhjMCBbYW1k?=
 =?UTF-8?B?Z3B1XSB3aGVuIHJlc3VtaW5nIGZyb20gUzMgc3RhdGU=?=
Date: Tue, 16 Feb 2021 15:41:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: kernelbugs@equaeghe.nospammail.net
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-209713-2300-90wl1ivaoE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209713-2300@https.bugzilla.kernel.org/>
References: <bug-209713-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDk3MTMKCkVyaWsg
UXVhZWdoZWJldXIgKGtlcm5lbGJ1Z3NAZXF1YWVnaGUubm9zcGFtbWFpbC5uZXQpIGNoYW5nZWQ6
CgogICAgICAgICAgIFdoYXQgICAgfFJlbW92ZWQgICAgICAgICAgICAgICAgICAgICB8QWRkZWQK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQogICAgICAgICAgICAgICAgIENDfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8a2VybmVsYnVnc0BlcXVhZWdoZS5ub3NwYW1tCiAgICAgICAgICAgICAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHxhaWwubmV0CgotLS0gQ29tbWVudCAjMTUg
ZnJvbSBFcmlrIFF1YWVnaGViZXVyIChrZXJuZWxidWdzQGVxdWFlZ2hlLm5vc3BhbW1haWwubmV0
KSAtLS0KQ3JlYXRlZCBhdHRhY2htZW50IDI5NTMxOQogIC0tPiBodHRwczovL2J1Z3ppbGxhLmtl
cm5lbC5vcmcvYXR0YWNobWVudC5jZ2k/aWQ9Mjk1MzE5JmFjdGlvbj1lZGl0ClRyYWNlIGZvciA1
LjEwLjE2IGF0IGJvb3QKCihJbiByZXBseSB0byBGcmFuayBLcnVnZXIgZnJvbSBjb21tZW50ICMx
MikKPiBJIGFtIHNlZWluZyB0aGUgYWZvcmVtZW50aW9uZWQgd2FybmluZyBhdCBib290IGZvciBr
ZXJuZWwgPj0gNS4xMC4xMCwgd2l0aAo+IGtlcm5lbC1maXJtd2FyZS1hbWRncHUtMjAyMTAxMTkg
KEFNRCBSeXplbiA3IFBSTyA0NzUwVSkuIFvigKZdCkkgY2FuIGNvbmZpcm0gdGhpcyBmb3IgNS4x
MC4xNi4KCi0tIApZb3UgbWF5IHJlcGx5IHRvIHRoaXMgZW1haWwgdG8gYWRkIGEgY29tbWVudC4K
CllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRo
ZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
