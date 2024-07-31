Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5867E94335C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 17:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AC710E65D;
	Wed, 31 Jul 2024 15:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tuta.io header.i=@tuta.io header.b="U6d49zxD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 383 seconds by postgrey-1.36 at gabe;
 Wed, 31 Jul 2024 15:05:50 UTC
Received: from w1.tutanota.de (w1.tutanota.de [81.3.6.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2D910E64F
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 15:05:50 +0000 (UTC)
Received: from tutadb.w10.tutanota.de (unknown [192.168.1.10])
 by w1.tutanota.de (Postfix) with ESMTP id 13A31FBFCAF
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 14:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722437966; 
 s=s1; d=tuta.io;
 h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
 bh=ZdYZbVVkjj7Ca6+wDx3k7btPS0WLcEsrm3DZASg9hvM=;
 b=U6d49zxDLv8S5sWjaDeQDbslFuvnIGJ6oTrCN2pqwWDlTHz+HxAtgnEom48xkepB
 e331oBs6La0vBPPkNZK4PWXQcpTQq+jwO/iGZOPQlGBk56HwnFsEi8f5gvHl70nDNJF
 GslSceWRxrsA6hckSUB5Ov/lzbUsHegoaiVUE2P4C7ex0o2zx3SeA7t61GMdl70i+fl
 Ru51gpefUjvJzb2ki4he8OsXHIJk5AW1rmh7gHrVkDRPqCddhkLAq8pYWhe9iVZcX9l
 NQpGsk2C0xwurJ/TJSAB+dEoqhmnrOFF5S5kfblrPkJcMIYvQLg7LqG3KKd7kSjIAdV
 DDuEHRYyAQ==
Date: Wed, 31 Jul 2024 16:59:26 +0200 (CEST)
From: marco.rodolfi@tuta.io
To: Dri Devel <dri-devel@lists.freedesktop.org>
Message-ID: <O38IOQa--3-9@tuta.io>
Subject: Issues with sending patch to this mailing list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 31 Jul 2024 15:30:09 +0000
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

Hi,

I have a patch staged to fix a quirks in the DRM rendering manager, but it seems that I can't send it up using an old email alias on gmail (since my current client, tutanota, do not support smtp and copy-pasting patches usually always screw up whitespaces).

I do not get nothing back from google as a bounced responce, so I'm not too sure on how to proceed.

Is gmail an allowed domain?

Marco
