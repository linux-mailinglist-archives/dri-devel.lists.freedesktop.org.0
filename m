Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC286E8B21
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E59E10EBBF;
	Thu, 20 Apr 2023 07:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB5910E8EE;
 Wed, 19 Apr 2023 09:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Date:Cc:To:
 From:Subject:Message-ID:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mW/ELGGt+nNEUAioDFQ7F2YKqEHixe4y/Tu+mBqY3bY=; b=sD6slWErxN+WjXUQ15qGbuB9z3
 jou8pW5owHP2j8nHACEHInYln2uuJZL4/k/tgAAfWM/kVDG99YOAWt73PTypdh3xYQ8ppYgnoBcWN
 dFVDTbbWc2qdp283dLXK0PzCboTCXb7gbsO/lbaTbUlVICCPgtW6F0LKtebQJOyPozSfLEP6bU2L1
 barlVlLGnQhqTb7KnFv9zkMFSjSLSt1kBu35ZiI7gys/JXqw6w6GVlXn3nfMHq9qnClMlXyKnaRLY
 tETt0A2QOrXv96UaFGsvBenj6qonBKY04307DLujXiFSScHAcmGudUHuJak1wRa+4iXYgs5Ym29OF
 +aJbYBow==;
Received: from 137.red-83-52-2.dynamicip.rima-tde.net ([83.52.2.137]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pp3qs-004fyJ-RG; Wed, 19 Apr 2023 11:11:46 +0200
Message-ID: <fa0f5162f38baf2743e3a8e01d4fc9ddc985da69.camel@igalia.com>
Subject: 2023 X.Org Foundation Membership deadline extended
From: Ricardo Garcia <rgarcia@igalia.com>
To: members@x.org, events@lists.x.org, xorg-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 libre-soc-dev <libre-soc-dev@lists.libre-soc.org>
Date: Wed, 19 Apr 2023 11:11:45 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Apr 2023 07:12:56 +0000
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
Cc: board <board@foundation.x.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Several people reported getting multiple membership and election emails
recently for the first time when we flushed the queue of messages which
had been unfortunately held in moderation in the events@lists.x.org
mailing list queue. Thanks Luc, Laurent and Harald for getting in touch!

Thanks to other mailing lists, we believe to have reached a wide
audience in any case. Membership numbers look good and we already have 8
candidates lined up for the upcoming voting process that was scheduled
to start this week.

Still, we believe it's fair to extend the membership application/renewal
deadline until the end of this week for those who haven't had the chance
to do so yet. The new deadline is April 23rd 23:59 UTC.

Please note that only current members can vote in the upcoming election.
If you are interested in joining the X.Org Foundation or in renewing
your membership, please visit the membership system site at:
https://members.x.org/

In order not to delay the process further, however, we will not accept
new candidates. You can see the current list here:

https://wiki.freedesktop.org/xorg/BoardOfDirectors/Elections/2023/

The election will start on April 24th and end on May 1st as was
initially planned, so members will have 1 week for voting instead of 2.
Reminders will be sent throughout the election week to members@x.org.

Thanks again for your attention,
-Ricardo Garcia, on behalf of the X.Org elections committee
