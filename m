Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9482686E028
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 12:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC52E10ECA8;
	Fri,  1 Mar 2024 11:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DbdPbgLR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6881910E2EA;
 Fri,  1 Mar 2024 11:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Cc:References:To:Subject:From:MIME-Version:Date:
 Message-ID:Content-Type:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9zGj0u7K/llTIdI+zCbw5MSt0B627m1u3Gyazm8fnG0=; b=DbdPbgLRFv9Jr4Na/vkh9jkbkh
 a2ZUqeXZMWz+dJI5mVrEl3Flq8+0yDCeOl3aMpafSme5Mn3lxL+H+sU8rxp9vx7EJ3/xhSDwGRCqg
 7S5tyfohr4TKlza911E06IvGnDJlfUjzTML/AuO4+ykWVRdwpgF6nzkUak7xltmf7eh0KFf3JcFvN
 dSP+Pk+u724DmUDBLm374IABVjo0vffvBoX75YXnZthpGu6Mgu7g89dasIwRD3lPKGnvDJAvkE+C/
 5fjjP9wxg9OXU9m2Z6iVeS/lPS/pAfTKJK+6kCJF2aLR4Nj7KM5rh7x+CrfwRJv2WpZCA/p9jRh9H
 TttfjN4w==;
Received: from c-71-59-88-35.hsd1.nj.comcast.net ([71.59.88.35]
 helo=[192.168.1.99]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rg11b-0051OZ-0a; Fri, 01 Mar 2024 12:25:59 +0100
Content-Type: multipart/alternative;
 boundary="------------PdOyCBePms0bkn01b4OZdjuV"
Message-ID: <08f8a967-25e1-4362-be38-3f1b050ec6f2@igalia.com>
Date: Fri, 1 Mar 2024 06:25:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christopher Michael <cmichael@igalia.com>
Subject: 2024 X.Org Board of Directors Elections timeline extended, request
 for nominations
To: events@lists.x.org, xorg-devel@lists.x.org,
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 libre-soc-dev@lists.libre-soc.org, elections@x.org, members@x.org,
 xorg@lists.freedesktop.org
References: <0efcdfe3-ea9e-43e5-ab07-6d69dca2c04a@igalia.com>
Content-Language: en-US
Cc: board <board@foundation.x.org>
In-Reply-To: <0efcdfe3-ea9e-43e5-ab07-6d69dca2c04a@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------PdOyCBePms0bkn01b4OZdjuV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

We are seeking nominations for candidates for election to the X.org 
Foundation Board of Directors. However, as we presently do not have 
enough nominations to start the election - the decision has been made to 
extend the timeline by 2 weeks. Note this is a fairly regular part of 
the elections process.


The new deadline for nominations to the X.org Board of Directors is 
23:59 UTC on 11 March 2024


The Board consists of directors elected from the membership. Each year, 
an election is held to bring the total number of directors to eight. The 
four members receiving the highest vote totals will serve as directors 
for two year terms.

The directors who received two year terms starting in 2023 were 
Arkadiusz Hiler, Christopher Michael, Lyude Paul, and Daniel Vetter. 
They will continue to serve until their term ends in 2024. Current 
directors whose term expires in 2024 are Emma Anholt, Mark Filion, 
Ricardo Garcia, and Alyssa Rosenzweig.
<https://rosenzweig.io/>

A director is expected to participate in the fortnightly IRC meeting to 
discuss current business and to attend the annual meeting of the X.Org 
Foundation, which will be held at a location determined in advance by 
the Board of Directors.

A member may nominate themselves or any other member they feel is 
qualified. Nominations should be sent to the Election Committee at 
elections@x.org.

Nominees shall be required to be current members of the X.Org 
Foundation, and submit a personal statement of up to 200 words that will 
be provided to prospective voters. The collected statements, along with 
the statement of contribution to the X.Org Foundation in the member's 
account page on http://members.x.org, will be made available to all 
voters to help them make their voting decisions.

Nominations and completed personal statements must be received no later 
than 23:59 UTC on 11 March 2024.

The slate of candidates will be published 18 March 2024 and candidate 
Q&A will begin then. The deadline for Xorg membership applications and 
renewals has also been extended 2 weeks and is now 25 March 2024.


Cheers,

Christopher Michael, on behalf of the X.Org BoD


--------------PdOyCBePms0bkn01b4OZdjuV
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>We are seeking nominations for candidates for election to the
      X.org Foundation Board of Directors. However, as we presently do
      not have enough nominations to start the election - the decision
      has been made to extend the timeline by 2 weeks. Note this is a
      fairly regular part of the elections process.</p>
    <p><br>
    </p>
    <p>The new deadline for nominations to the X.org Board of Directors
      is 23:59 UTC on 11 March 2024</p>
    <br>
    The Board consists of directors elected from the membership. Each
    year, an election is held to bring the total number of directors to
    eight. The four members receiving the highest vote totals will serve
    as directors for two year terms.
    <p>The directors who received two year terms starting in 2023 were <span
        class="createlink">Arkadiusz Hiler, </span><span
        class="createlink">Christopher Michael, </span><span
        class="createlink">Lyude Paul, and Daniel Vetter</span>. They
      will continue to serve until their term ends in 2024. Current
      directors whose term expires in 2024 are <span class="createlink">Emma
        Anholt, </span><span class="createlink">Mark Filion, </span><span
        class="createlink">Ricardo Garcia, and Alyssa Rosenzweig.</span><a
        href="https://rosenzweig.io/"><br>
      </a></p>
    <p>A director is expected to participate in the fortnightly IRC
      meeting to discuss current business and to attend the annual
      meeting of the X.Org Foundation, which will be held at a location
      determined in advance by the Board of Directors.</p>
    <p>A member may nominate themselves or any other member they feel is
      qualified. Nominations should be sent to the Election Committee at
      <a class="moz-txt-link-abbreviated moz-txt-link-freetext"
        href="mailto:elections@x.org">elections@x.org</a>.<br>
    </p>
    <p>Nominees shall be required to be current members of the X.Org
      Foundation, and submit a personal statement of up to 200 words
      that will be provided to prospective voters. The collected
      statements, along with the statement of contribution to the X.Org
      Foundation in the member's account page on <a
        class="moz-txt-link-freetext" href="http://members.x.org">http://members.x.org</a>,
      will be made available to all voters to help them make their
      voting decisions.</p>
    <p>Nominations and completed personal statements must be received no
      later than 23:59 UTC on 11 March 2024.</p>
    <p>The slate of candidates will be published 18 March 2024 and
      candidate Q&amp;A will begin then. The deadline for Xorg
      membership applications and renewals has also been extended 2
      weeks and is now 25 March 2024.</p>
    <p><br>
    </p>
    <p>Cheers,</p>
    <p>Christopher Michael, on behalf of the X.Org BoD</p>
    <p><br>
    </p>
  </body>
</html>

--------------PdOyCBePms0bkn01b4OZdjuV--
