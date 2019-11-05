Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFE2EFE78
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 14:29:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85166EA55;
	Tue,  5 Nov 2019 13:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D86A6E8F1
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 04:53:42 +0000 (UTC)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 476cgw5LH0zJb;
 Tue,  5 Nov 2019 05:51:24 +0100 (CET)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date: Tue, 5 Nov 2019 05:53:37 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Jamal Shareef <jamal.k.shareef@gmail.com>
Subject: Re: [PATCH 0/3] drm/tegra: Remove space after parenthesis
Message-ID: <20191105045337.GB1764@qmqm.qmqm.pl>
References: <cover.1572920482.git.jamal.k.shareef@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1572920482.git.jamal.k.shareef@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 05 Nov 2019 13:29:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=rere.qmqm.pl; s=1; 
 t=1572929485; bh=ynk/Jlv4zfIApiDvMMJssbkmr9wLbQcF3N8lX8JdzoE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FhJB42GySupSrJPyjQL3OufU9k7mKEsWcFJus2/144sX8U56P+8nPlHSIofh8/QZW
 WJrU6xxxMUXvRrvvmLwu7BMCRY55E1dLA8Xvu8QqezwJ4WzqAnx9zPkvsGHM64wugw
 p3PO88gw9NzyIwvT/ffb9MWcYt6O0mZXf+2itj1iyFw23LaNxRk2QQPQ/VSmAUWvd3
 90OWSfkUF2cMwAYBodeoJZBxVfbx4e85rCakQFZmEuMCRKIUW1ZFW4CKjbcgwUxRs1
 CQs2GJQ96jNY9JMzw07OlnENdp6122UT31L6oKVSyv9lSNFxgRrcput3RkCWVQ8Hn0
 fEWvqqx4BpA9g==
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 outreachy-kernel@googlegroups.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMDY6MjM6MTlQTSAtMDgwMCwgSmFtYWwgU2hhcmVlZiB3
cm90ZToKPiBUaGlzIHBhdGNoc2V0IHJlbW92ZXMgc3BhY2VzIGFmdGVyIGxlZnQgb3BlbiBwYXJl
bnRoZXNpcy4KPiBJc3N1ZSBmb3VuZCBieSBjaGVja3BhdGNoLgoKSSdkIHNheSB0aGF0IHRob3Nl
IHNwYWNlcyBtYWtlIGNvZGUgZWFzaWVyIHRvIGxvb2sgYXQsIHNvIGl0IHdvdWxkCmJlIGJldHRl
ciB0byB0ZWFjaCBjaGVja3BhdGNoIHRvIGlnbm9yZSBjYXNlcyBsaWtlIHRoZXNlLgoKQmVzdCBS
ZWdhcmRzLApNaWNoYcWCwqBNaXJvc8WCYXcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
