Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 435356EB3E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 21:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7176E85B;
	Fri, 19 Jul 2019 19:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55096E85B
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 19:45:24 +0000 (UTC)
Subject: Re: [PULL] drm-next fixes for -rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190719154207.GA9708@phenom.ffwll.local>
References: <20190719154207.GA9708@phenom.ffwll.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190719154207.GA9708@phenom.ffwll.local>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2019-07-19
X-PR-Tracked-Commit-Id: 8ee795625665208589a97972b01790bb04ea83e3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 31cc088a4f5d83481c6f5041bd6eb06115b974af
Message-Id: <156356552472.25668.6959970865866797426.pr-tracker-bot@kernel.org>
Date: Fri, 19 Jul 2019 19:45:24 +0000
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563565524;
 bh=i+PCBNu57gHOpirHmEo1+Qwpm5zVD18MBNcnfEZKYPg=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Megbv5LGEDYK7/pSL5O+w8eZZxQInmOV5nNlUAdLTLFrMEaH7c9ad5aCor2Jtu4Av
 aj2PTfv9ED1/kYCxpJ9627PelcwetpXglNRttuRtpCo5AryAs9tr5nOCZz5qXLrzBd
 rysi0O5x70dC3LW7DvKRS5l4tDB7B/U6KazUH6eo=
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDE5IEp1bCAyMDE5IDE3OjQyOjU2ICsw
MjAwOgoKPiBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtIHRhZ3MvZHJtLW5l
eHQtMjAxOS0wNy0xOQoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9ydmFsZHMvbGludXguZ2l0Ogpo
dHRwczovL2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvMzFjYzA4OGE0ZjVkODM0ODFjNmY1MDQx
YmQ2ZWIwNjExNWI5NzRhZgoKVGhhbmsgeW91IQoKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBi
b3QuCmh0dHBzOi8va29yZy53aWtpLmtlcm5lbC5vcmcvdXNlcmRvYy9wcnRyYWNrZXIKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
