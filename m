Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DDB2BA43
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 20:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0549289A56;
	Mon, 27 May 2019 18:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665D289A56
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 18:38:48 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id D9935287DA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 18:38:47 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id CBCB7287F3; Mon, 27 May 2019 18:38:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203627] [Regression] Boot fails with linux-firmware 20190514
Date: Mon, 27 May 2019 18:38:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: macgeneral@macgeneral.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203627-2300-61h2pp9EZ4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203627-2300@https.bugzilla.kernel.org/>
References: <bug-203627-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDM2MjcKCkFybmUg
RmFocmVud2FsZGUgKG1hY2dlbmVyYWxAbWFjZ2VuZXJhbC5kZSkgY2hhbmdlZDoKCiAgICAgICAg
ICAgV2hhdCAgICB8UmVtb3ZlZCAgICAgICAgICAgICAgICAgICAgIHxBZGRlZAotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiAgICAgICAgICAgICAgICAgQ0N8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHxtYWNnZW5lcmFsQG1hY2dlbmVyYWwuZGUKCi0tLSBDb21tZW50ICMzIGZyb20gQXJuZSBGYWhy
ZW53YWxkZSAobWFjZ2VuZXJhbEBtYWNnZW5lcmFsLmRlKSAtLS0KSSdtIGp1c3QgaGVyZSB0byBz
dGF0ZSB0aGF0IEknbSBhZmZlY3RlZCBhcyB3ZWxsLgoKS2VybmVsIHZlcnNpb25zIDUueCBib290
IGZpbmUgd2l0aCBsaW51eC1maXJtd2FyZSAyMDE5MDUxNC43MTFkMzI5LTEsCktlcm5lbCB2ZXJz
aW9uIDQuMTkueCBjcmFzaGVzIGRpcmVjdGx5IGFmdGVyIHRyeWluZyB0byBsb2FkIHRoZSBhbWRn
cHUgZHJpdmVyLgpUaGUgc2NyZWVuIHR1cm5zIG9mZiBhbmQgdGhlIHN5c3RlbSBvbmx5IGhhbmdz
L3JlYWN0cyB0byB0aGUgcmVzZXQgYnV0dG9uCihDVFJMLUFMVC1ERUxFVEUgd29uJ3Qgd29yayBl
aXRoZXIpLiBVbmZvcnR1bmF0ZWx5IG5vdGhpbmcgaXMgbG9nZ2VkLgoKRG93bmdyYWRpbmcgdG8g
bGludXgtZmlybXdhcmUgMjAxOTA0MjQuNGI2Y2YyYi0xIGZpeGVkIGl0IGZvciBtZSBmb3Igbm93
LgoKT1M6IE1hbmphcm8gTGludXgKSGFyZHdhcmUgYWZmZWN0ZWQ6IEFNRCBWZWdhIDY0ICgxMCkg
KEFTVVMgUk9HIFNUUklYKQoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNl
OgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
