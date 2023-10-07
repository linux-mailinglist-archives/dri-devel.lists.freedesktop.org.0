Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E73C67BC7DD
	for <lists+dri-devel@lfdr.de>; Sat,  7 Oct 2023 14:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B6610E062;
	Sat,  7 Oct 2023 12:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2041210E062
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Oct 2023 12:52:34 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 75EC27C0;
 Sat,  7 Oct 2023 12:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 75EC27C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1696683153; bh=PgWW8D6ZHEnTOunHt8IQOGYCHMCY50wDEuOa7EF0Gis=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Cw1ttCn9rFw0TyTeC7CdnQpEyIZErUF5czDpJb7KKMWbh1YrKuQ4tDxh+lOOBbYWE
 ZTmQTW5o11R7ZH/2vuzugrm5Zf8ETYGIS4rMq4qX4pmgUGdiHBdIlxbdzPVX4Kivct
 dSNnA0kYjfZXX47zVgx0XJqr3bGG4heSy2jrWcPvSAud2BtNu5KgsdZQwyd8y9fV2C
 vpGOtoahCJUKQOIZXjDkwraEZBWFf9w8jLyqt7MMItZToGpHxBWUyEm4/PF0Fjohr6
 VUdp28VynOqWZJL2STT+lHKZBMpWf9+Cp54Sn3+xOdTuvoHcWVDzCoPrtQ1C5iO2Aw
 uObVv+LxUBXug==
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 0/2] Add support for inlined documentation for kunit and
 kselftests
In-Reply-To: <20231007100946.396187d4@sal.lan>
References: <cover.1693550658.git.mchehab@kernel.org>
 <87pm1vd4kb.fsf@meer.lwn.net> <20231007100946.396187d4@sal.lan>
Date: Sat, 07 Oct 2023 06:52:32 -0600
Message-ID: <877cnyvblb.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mauro Carvalho Chehab <mchehab@kernel.org> writes:

> Should I wait for you to take a look at patch 1/2 before sending
> a new version?

Go ahead and resend whenever...I'm still digging out from the last few
weeks.

Thanks,

jon
