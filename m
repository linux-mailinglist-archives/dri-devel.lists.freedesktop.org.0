Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77549CC9BE
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 13:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FCC6E231;
	Sat,  5 Oct 2019 11:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F296E231
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2019 11:49:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204725] black screen
Date: Sat, 05 Oct 2019 11:49:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: drjoms@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204725-2300-Yt08UIcqLC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204725-2300@https.bugzilla.kernel.org/>
References: <bug-204725-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: mail.kernel.org; dkim=permerror (bad
 message/signature format)
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ3MjUKCi0tLSBD
b21tZW50ICM1MyBmcm9tIERtaXRyaSBTZWxldHNraSAoZHJqb21zQGdtYWlsLmNvbSkgLS0tCm1h
ZGUgbWlub3IgZXJyb3IuCmNvbXBpbGVkIDUuNHIxCmNvbXBpbGVkIGluICdEQ04gMi4xIGZhbWls
eScuIEkgZG9uJ3QgaGFyZHdhcmUgZm9yIGl0LgpXaXRoIGl0IGFuZCBEQ04gMi4wIGkgZ2V0IGNv
bnNvbGUuCkkgZ2V0IHRvIHNlZSBYb3JnLiB0aG91Z2ggbm90IHN1cmUgaWYgaXQncyB2ZXNhIG9y
IG5vdCwgYmVjYXVzZSByZXNvbHV0aW9uIGlzCnZlcnkgd3JvbmcgZm9yIG15IHNjcmVlbi4KRm91
bmQgYW5vdGhlciBidWcgaW4gNS40LXJjMQoKSSBkaXNhYmxlZCBEQ04gMi4xIGZhbWlseQoKCjNk
IEdhbWVzIHdvcmsgd2l0aCA1LjQtcmMxIGJ1dCBjcnVzaCBpZiBmdWxsIHNjcmVlbi4gU29tZXRp
bWVzIGl0IHdpbGwgd29yaywKYnV0IHdoZW4gcXVpdCAtIGl0IGhhbmdzIFhvcmcuIFByb2Nlc3Nl
cyBzZWVtIHRvIHJ1biwgYXMgbXVzaWMgc3RpbGwgcGxheWluZy4KCklmIHNvbWVvbmUgc3RpbGwg
bG9va2luZyBoZXJlIGkgY2FuIGdpdmUgbW9yZSBkZXRhaWxzLgoKLS0gCllvdSBhcmUgcmVjZWl2
aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0
aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
